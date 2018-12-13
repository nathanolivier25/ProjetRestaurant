using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;

namespace Model
{
    public class ClientGroup : People
    {
        Command command;
        IStrategyClientGroup strategy;

        private int ID = 0;

        public ClientGroup(IStrategyClientGroup givenStrategy, BDDConnection bdd_connection, int id_group) : base(bdd_connection)
        {
            strategy = givenStrategy;

            this.strategy.IDGroup = id_group;

            this.Thread = new Thread(new ThreadStart(ThreadLoop));
            this.Thread.Start();
        }

        public void ThreadLoop()
        {
            while (this.Thread.IsAlive)
            {
                strategy.RoleStrategy();
            }
        }
    }
}

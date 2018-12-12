using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;


namespace Model
{
    public class Butler : People
    {
        IStrategyButler strategy;

        public Butler(IStrategyButler givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
            this.thread = new Thread(new ThreadStart(ThreadLoop));
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

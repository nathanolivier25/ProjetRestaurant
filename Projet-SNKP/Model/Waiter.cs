using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;

namespace Model
{
    public class Waiter: People
    {
        IStrategyWaiter strategy;
        private int carre = 0;
        private List<int> id_tables = null;

        public Waiter(IStrategyWaiter givenStrategy, BDDConnection bdd_connection, int carre) : base(bdd_connection)
        {
            strategy = givenStrategy;

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

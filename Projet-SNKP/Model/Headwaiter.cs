using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;

namespace Model
{
    public class HeadWaiter : People
    {
        IStrategyHeadWaiter strategy;
        private int carre = 0;
        private List<int> id_tables = null;
        private static ExchangerDesk exchanger_desk = null;

        public HeadWaiter(IStrategyHeadWaiter givenStrategy, BDDConnection bdd_connection, int carre)
            : base(bdd_connection)
        {
            strategy = givenStrategy;
            strategy.Carre = carre;

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

        public static ExchangerDesk ExchangerDesk
        {
            get { return exchanger_desk; }
            set { exchanger_desk = value; }
        }
    }
}

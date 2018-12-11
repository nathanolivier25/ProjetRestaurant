using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using CuisineController;
using BDD;


namespace Model
{
  public class Chef : People
    {
        IStrategyChef strategy;
        private BDDConnection bdd_connection = null;

        public Chef(IStrategyChef givenStrategy)
        {
            strategy = givenStrategy;
            this.Thread = new Thread(new ThreadStart(ThreadLoop));
        }
        public void ThreadLoop()
        {
            StrategyChef strategy_chef = new StrategyChef();
            strategy_chef.BDDConnection = this.bdd_connection;

            while (this.Thread.IsAlive)
            {
                strategy_chef.RoleStrategy();
            }
        }

        public BDDConnection BDDConnection
        {
            get { return this.bdd_connection; }
            set { this.bdd_connection = value; }
        }


    }
}

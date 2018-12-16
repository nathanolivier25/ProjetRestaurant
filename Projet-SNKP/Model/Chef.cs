using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Interface;
using BDD;


namespace Model
{
  public class Chef : People
    {
        public IStrategyChef strategy;
        private BDDConnection bdd_connection = null;

        public Chef(IStrategyChef givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            Console.WriteLine("Le CHEF vient d'arriver au restaurant");

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


        public IStrategyChef getStrategy()
        {
            return this.strategy;
        }


    }
}

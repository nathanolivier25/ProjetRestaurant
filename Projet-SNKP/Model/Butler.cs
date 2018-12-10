using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using SalleController;

namespace Model
{
    public class Butler : People
    {

        IStrategyButler strategy;
        private BDDConnection bdd_connection = null;

        public Butler(IStrategyButler givenStrategy)
        {
            strategy = givenStrategy;
            this.Thread = new Thread(new ThreadStart(ThreadLoop));
        }

        public void ThreadLoop()
        {
            StrategyButler strategy_butler = new StrategyButler();
            strategy_butler.BDDConnection = this.bdd_connection;
            while (this.Thread.IsAlive)
            {
                strategy_butler.RoleStrategy();
            }
        }

        /*private int choisirTable(int nb_clients)
        {
            this.bdd_connection.executeQuery("SELECT Nb_places FROM TableRestaurant");
        }*/

        public BDDConnection BDDConnection
        {
            set { this.bdd_connection = value; }
        }
    }
}

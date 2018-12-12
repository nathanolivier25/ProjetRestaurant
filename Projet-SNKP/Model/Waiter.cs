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
            /*strategy = givenStrategy;

            this.bdd_connection = new BDDConnection("SÉBASTIEN", "Test");

            this.carre = carre;
            this.id_tables = new List<int>();

            // Get the waiter tables
            List<List<string>> list_tables = this.bdd_connection.executeQuery(RestaurantQueries.getWaiterTables(carre));
            for(int i = 0; i < list_tables.LongCount(); i++)
            {
                this.id_tables.Add(int.Parse(list_tables[i][0]));
            }

            this.Thread = new Thread(new ThreadStart(ThreadLoop));
            this.Thread.Start();*/
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

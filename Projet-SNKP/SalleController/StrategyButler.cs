using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace SalleController
{
    public class StrategyButler : IStrategyButler
    {
        private BDDConnection bdd_connection = null;

        public StrategyButler(BDDConnection bdd_connection = null)
        {
            this.bdd_connection = bdd_connection;
        }

        public override int RoleStrategy()
        {
            List<List<String>> idgroupcheck = this.bdd_connection.executeQuery(RestaurantQueries.getNewGroupClient());
            if (idgroupcheck.Count > 0) // Wait for a new group of client
            {
                // Get the ID from the clients group
                int id_group = Int32.Parse(idgroupcheck.ElementAt(0).ElementAt(0));

                // Set the group state to 1 (welcomed)
                this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToWelcomed(id_group));

                // Get the number of client from the group
                int nb_clients = Int32.Parse( this.bdd_connection.executeQuery(RestaurantQueries.getNbClientInGroup(id_group)).ElementAt(0).ElementAt(0) );

                // Get the table ID for the group
                List<List<String>> tableidcheck = this.bdd_connection.executeQuery(RestaurantQueries.getFreeTable(nb_clients));

                if (!(tableidcheck.Count > 0))
                {
                    Console.WriteLine("Pas de table disponible");
                    return 0;
                }
                int id_table = Int32.Parse(tableidcheck.ElementAt(0).ElementAt(0));

                // Set the table state to occupied
                this.bdd_connection.executeNonQuery(RestaurantQueries.setTableOccupied(id_table));

                Console.WriteLine(id_table);
            }
            return 0;
        }

        // Returns the number of clients in the group
        public int getNbClientsInGroup(int id_group)
        {
            this.bdd_connection.executeQuery(RestaurantQueries.getNbClientInGroup(id_group));
            return this.bdd_connection.Data.GetInt32(0);
        }

        public int chooseTable(int nb_clients)
        {
            this.bdd_connection.executeQuery(RestaurantQueries.getFreeTable(nb_clients));
            int id_table = this.bdd_connection.Data.GetInt32(0);
            this.bdd_connection.executeQuery(RestaurantQueries.setTableOccupied(id_table));
            return id_table;
        }
    }
}

using BDD;
using Model;
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
                Console.WriteLine("Accueil du groupe " + id_group);

                // Set the group state to 1 (welcomed)
                this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToWelcomed(id_group));

                // Get the number of client from the group
                int nb_clients = Int32.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getNbClientInGroup(id_group)).ElementAt(0).ElementAt(0));

                // Get the table ID for the group
                List<List<String>> tableidcheck = this.bdd_connection.executeQuery(RestaurantQueries.getFreeTable(nb_clients));

                if (!(tableidcheck.Count > 0))
                {
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupState(id_group, -2));
                    Console.WriteLine("Le groupe " + id_group + " quitte le restaurant car il n'y a plus de places");
                    return 0;
                }
                int id_table = Int32.Parse(tableidcheck.ElementAt(0).ElementAt(0));

                // Set the table state to occupied
                this.bdd_connection.executeNonQuery(RestaurantQueries.setTableOccupied(id_table));

                // Set the group table ID
                this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupTable(id_group, id_table));
            }

            List<List<string>> list = this.bdd_connection.executeQuery("SELECT * FROM groupclient WHERE Etat = 7");
            if(list.Count > 0)
            {
                int id_group = int.Parse(list[0][0]);
                this.bdd_connection.executeQuery(RestaurantQueries.setGroupState(id_group, -1));

                int id_table = int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getGroupTable(id_group))[0][0]);
                this.bdd_connection.executeQuery(RestaurantQueries.setTableFree(id_table));

                this.bdd_connection.executeNonQuery(RestaurantQueries.setTableGroupIDToNull(id_table));

                ConsoleDisplayer.display("Le groupe " + id_group + " paye");
                Butler.Timer.wait(30);
                ConsoleDisplayer.display("Le groupe " + id_group + " a quitté le restaurant");
            }
            return 0;
        }

        // Returns the number of clients in the group
        public int getNbClientsInGroup(int id_group)
        {
            this.bdd_connection.executeQuery(RestaurantQueries.getNbClientInGroup(id_group));
            return this.bdd_connection.Data.GetInt32(0);
        }

        // Choose a table for the group
        public int chooseTable(int nb_clients)
        {
            this.bdd_connection.executeQuery(RestaurantQueries.getFreeTable(nb_clients));
            int id_table = this.bdd_connection.Data.GetInt32(0);
            this.bdd_connection.executeQuery(RestaurantQueries.setTableOccupied(id_table));
            return id_table;
        }
    }
}

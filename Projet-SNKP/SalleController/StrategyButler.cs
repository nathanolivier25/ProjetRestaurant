using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalleController
{
    public class StrategyButler : IStrategyButler
    {
        private BDDConnection bdd_connection = null;

        public StrategyButler()
        {
            
        }

        public BDDConnection BDDConnection
        {
            set { this.bdd_connection = value; }
        }

        public override int RoleStrategy()
        {
            this.bdd_connection.executeQuery(this.bdd_connection.Queries.getNewGroupClient());
            if (this.bdd_connection.hasData()) // Wait for a new group of client
            {
                // Get the ID from the clients group
                int id_group = this.bdd_connection.Data.GetInt32(0);

                // Set the group state to 1 (welcomed)
                this.bdd_connection.executeNonQuery(
                    this.bdd_connection.Queries.setGroupStateToWelcomed(id_group));

                return id_group;

                // Get the number of client from the group
                this.bdd_connection.executeQuery(this.bdd_connection.Queries.getNbClientInGroup(id_group));
                int nb_clients = this.bdd_connection.Data.GetInt32(0);

                // Get the table ID for the group
                this.bdd_connection.executeQuery(this.bdd_connection.Queries.getFreeTable(nb_clients));

                if (!this.bdd_connection.hasData())
                {
                    Console.WriteLine("Pas de table disponible");
                    return 0;
                }
                int id_table = this.bdd_connection.Data.GetInt32(0);

                // Set the table state to occupied
                this.bdd_connection.executeNonQuery(this.bdd_connection.Queries.setTableOccupied(id_table));

                Console.WriteLine(id_table);
            }
            return 0;
        }

        // Returns the number of clients in the group
        public int getNbClientsInGroup(int id_group)
        {
            this.bdd_connection.executeQuery(this.bdd_connection.Queries.getNbClientInGroup(id_group));
            return this.bdd_connection.Data.GetInt32(0);
        }

        public int chooseTable(int nb_clients)
        {
            this.bdd_connection.executeQuery(this.bdd_connection.Queries.getFreeTable(nb_clients));
            return this.bdd_connection.Data.GetInt32(0);
        }
    }
}

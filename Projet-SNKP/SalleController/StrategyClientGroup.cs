using BDD;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;

namespace SalleController
{
    public class StrategyClientGroup : IStrategyClientGroup
    {
        private BDDConnection bdd_connection = null;
        private int ID_group = 0;

        public StrategyClientGroup(BDDConnection bdd_connection = null)
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
        }

        public override void RoleStrategy()
        {
            List<List<string>> list_client_state = this.bdd_connection.executeQuery(RestaurantQueries.getGroupState(this.ID_group));
            int state = int.Parse(list_client_state[0][0]);

            float sleep_time = 0.0f;

            switch (state)
            {
                case 3:
                    Console.WriteLine("Le groupe " + ID_group + " consulte le menu");
                    this.bdd_connection.executeQuery(RestaurantQueries.setGroupStateToUnavailable(ID_group));
                    sleep_time = float.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getTaskDuration("Choose menu"))[0][0]);
                    Butler.Timer.wait(sleep_time);

                    this.bdd_connection.executeQuery(RestaurantQueries.setGroupStateToTakeCommand(ID_group));
                    Console.WriteLine("Le groupe " + ID_group + " attend pour passer sa commande");
                    break;
                case 5:
                    Console.WriteLine("Le groupe " + ID_group + " donne sa commande");

                    // Create new command in the bdd
                    int id_table = int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getGroupTable(ID_group))[0][0]);
                    this.bdd_connection.executeNonQuery(RestaurantQueries.createCommand(id_table));
                    int id_command = int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getCommandID(id_table))[0][0]);
                    int nb_clients = int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getNbClientInGroup(ID_group))[0][0]);

                    // Choose the menu for each customer
                    Random random = new Random();
                    sleep_time = int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getTaskDuration("Command"))[0][0]);
                    int id_preparation = 0;
                    for (int i = 0; i < nb_clients; i++)
                    {
                        id_preparation = random.Next(1, 11);
                        this.bdd_connection.executeNonQuery(RestaurantQueries.addAppetizer(id_command, id_preparation));
                        id_preparation = random.Next(11, 21);
                        this.bdd_connection.executeNonQuery(RestaurantQueries.addMainCourse(id_command, id_preparation));
                        id_preparation = random.Next(21, 31);
                        this.bdd_connection.executeNonQuery(RestaurantQueries.addDessert(id_command, id_preparation));
                        Butler.Timer.wait(sleep_time);
                    }

                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupState(ID_group, 6));
                    Console.WriteLine("Le groupe " + ID_group + " a validé sa commande");

                    break;
            }
        }

        public override int IDGroup
        {
            set { this.ID_group = value; }
        }
    }
}

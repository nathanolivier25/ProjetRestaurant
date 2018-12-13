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
    public class StrategyHeadWaiter : IStrategyHeadWaiter
    {
        private BDDConnection bdd_connection = null;
        private List<int> list_tables = null;
        private int carre = 0;

        public StrategyHeadWaiter()
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "Test");
        }

        public override void RoleStrategy()
        {
            // Check for group to place
            List<List<string>> list_group_to_place = this.bdd_connection.executeQuery(RestaurantQueries.getCustomersToPlace(this.carre));

            if (list_group_to_place.Count > 0)
            {
                try
                {
                    int id_group = int.Parse(list_group_to_place[0][0]);
                    int id_table = int.Parse(list_group_to_place[0][1]);
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToUnavailable(id_group));

                    Console.WriteLine("Placement du groupe " + id_group);
                    List<List<string>> list_duration = this.bdd_connection.executeQuery(
                        RestaurantQueries.getTaskDuration("Place group"));
                    float time = float.Parse(list_duration[0][0]);
                    Thread.Sleep((int)time);

                    this.bdd_connection.executeNonQuery(RestaurantQueries.setTableGroupID(id_table, id_group));
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToInstalled(id_group));
                    Console.WriteLine("Le groupe " + id_group + " est installé");

                    Console.WriteLine("Le chef de rang va chercher la carte pour le groupe " + id_group);
                    list_duration = this.bdd_connection.executeQuery(RestaurantQueries.getTaskDuration("Bring card"));
                    time = float.Parse(list_duration[0][0]);

                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToUnavailable(id_group));

                    Thread.Sleep((int)time);
                    Console.WriteLine("Le chef de rang donne la carte au groupe " + id_group);
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupState(id_group, 3));

                    ClientGroup group_client = new ClientGroup(new StrategyClientGroup(), this.bdd_connection, id_group);
                }
                catch (FormatException) { }
            }

            // Check if a group wants to take her command
            List<List<string>> list_commands_to_take = this.bdd_connection.executeQuery(RestaurantQueries.getCommandToTake());
            if (list_commands_to_take.Count > 0)
            {
                int id_group = int.Parse(list_commands_to_take[0][0]);

            }
        }

        public override int Carre
        {
            get { return this.carre; }
            set { this.carre = value; }
        }
    }
}

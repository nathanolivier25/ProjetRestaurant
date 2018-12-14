using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace SalleController
{
    public class StrategyWaiter : IStrategyWaiter
    {
        private BDDConnection bdd_connection = null;

        public StrategyWaiter(BDDConnection bdd_connection)
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
        }

        public override void RoleStrategy()
        {
            // Check for group to place
            //List<List<string>> list_group_to_place = this.bdd_connection.executeQuery(RestaurantQueries.getCustomersToPlace());

            /*if (list_group_to_place.Count > 0)
            {
                try
                {
                    int id_group = int.Parse(list_group_to_place[0][0]);
                    int id_table = int.Parse(list_group_to_place[0][1]);
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToUnavailable(id_group));
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setTableGroupID(id_table, id_group));
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToInstalled(id_group));
                    Console.WriteLine("Installation du groupe " + id_group.ToString() + " à la table " + id_table.ToString());
                }
                catch (FormatException) { }
            }*/
        }
    }
}

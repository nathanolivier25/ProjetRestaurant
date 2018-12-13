using BDD;
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
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "Test");
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
                    Thread.Sleep((int)sleep_time);

                    this.bdd_connection.executeQuery(RestaurantQueries.setGroupStateToTakeCommand(ID_group));
                    Console.WriteLine("Le groupe " + ID_group + " attend pour passer sa commande");
                    break;
            }
        }

        public override int IDGroup
        {
            set { this.ID_group = value; }
        }
    }
}

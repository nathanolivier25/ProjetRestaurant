using BDD;
using Interface;
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
        private ExchangerDesk exchanger_desk = null;
        private int carre = 0;

        public StrategyHeadWaiter()
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
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
                    Butler.Timer.wait(time);

                    this.bdd_connection.executeNonQuery(RestaurantQueries.setTableGroupID(id_table, id_group));
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToInstalled(id_group));
                    Console.WriteLine("Le groupe " + id_group + " est installé");

                    Console.WriteLine("Le chef de rang va chercher la carte pour le groupe " + id_group);
                    list_duration = this.bdd_connection.executeQuery(RestaurantQueries.getTaskDuration("Bring card"));
                    time = float.Parse(list_duration[0][0]);

                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToUnavailable(id_group));

                    Butler.Timer.wait(time);
                    Console.WriteLine("Le chef de rang donne la carte au groupe " + id_group);
                    this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupState(id_group, 3));

                    ClientGroup group_client = new ClientGroup(new StrategyClientGroup(), this.bdd_connection, id_group);
                }
                catch (FormatException) { }
            }

            // Check if a group wants to take her command
            List<List<string>> list_commands_to_take = this.bdd_connection.executeQuery(RestaurantQueries.getCommandToTake(carre));
            if (list_commands_to_take.Count > 0)
            {
                int id_group = int.Parse(list_commands_to_take[0][0]);
                this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupStateToOrder(id_group));
                Console.WriteLine("Le chef de rang vient prendre la commande du groupe " + id_group);
                while (!int.Parse(this.bdd_connection.executeQuery(RestaurantQueries.getGroupState(id_group))[0][0]).Equals(6))
                {
                    //Console.WriteLine(this.bdd_connection.executeQuery(RestaurantQueries.getGroupState(id_group))[0][0]);
                    //Thread.Sleep(100);
                }
                ConsoleDisplayer.display("Le chef de rang apporte la commande au comptoir");
                /*List<List<string>> list_ligne_commande = this.bdd_connection.executeQuery(
                    RestaurantQueries.getGroupIDPreparations(id_group));
                for(int i = 0; i < list_ligne_commande[0].Count; i++)
                {
                    HeadWaiter.ExchangerDesk.AddToDesk(new TransferableItemDecorator(int.Parse(list_ligne_commande[i][0]), TransferableItemDecorator.Type.Preparation));
                }*/
            }
        }

        public override int Carre
        {
            get { return this.carre; }
            set { this.carre = value; }
        }

        public ExchangerDesk ExchangerDesk
        {
            get { return this.exchanger_desk; }
            set { this.exchanger_desk = value; }
        }
    }
}

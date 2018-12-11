using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    public class RestaurantQueries
    {
        private static string table_group_client = "GroupClient";
        private static string table_table_restaurant = "TableRestaurant";

        public RestaurantQueries()
        {

        }

        public static string getNewGroupClient()
        {
            return "SELECT * FROM " + table_group_client + " WHERE Etat = 0;";
        }

        public static string setGroupStateToWelcomed(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 1 WHERE ID = " + 
                id_group.ToString() + ";";
        }

        public static string getNbClientInGroup(int id_group)
        {
            return "SELECT Nb_Clients FROM " + table_group_client + " WHERE ID = " + id_group.ToString() + ";";
        }

        public static string getFreeTable(int nb_clients)
        {
            return "SELECT ID FROM " + table_table_restaurant + " WHERE Etat = 0 AND Nb_places >= " + 
                nb_clients.ToString() + " ORDER BY Nb_places;";
        }

        public static string setTableOccupied(int id_table)
        {
            return "UPDATE " + table_table_restaurant + " SET Etat = 1 WHERE ID = " + 
                id_table.ToString() + ";";
        }
    }
}

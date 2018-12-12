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

        public static string setGroupStateToUnavailable(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = -1 WHERE ID = " + id_group;
        }

        public static string setGroupStateToWelcomed(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 1 WHERE ID = " + 
                id_group.ToString() + ";";
        }

        public static string setGroupStateToInstalled(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 2 WHERE ID = " + id_group;
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

        public static string setGroupTable(int id_group, int id_table)
        {
            return "UPDATE " + table_group_client + " SET ID_Table = " + id_table + " WHERE ID = " + id_group;
        }

        public static string getWaiterTables(int id_carre)
        {
            return "SELECT ID FROM " + table_table_restaurant + " WHERE ID_carre = " + id_carre;
        }

        public static string getCustomersToPlace(int carre)
        {
            return "SELECT " + table_group_client + ".ID, " + table_group_client + ".ID_Table FROM " + table_group_client +
                " INNER JOIN " + table_table_restaurant + " ON " + table_group_client + ".ID_Table = " + table_table_restaurant +
                ".ID WHERE " + table_group_client + ".Etat = 1 AND " + table_table_restaurant + ".ID_Carre = " + carre + ";";
        }

        public static string setTableGroupID(int id_table, int id_group)
        {
            return "UPDATE " + table_table_restaurant + " SET ID_Group = " + id_group + " WHERE ID = " + id_table;
        }

        public static string getTaskDuration(string task_name)
        {
            return "SELECT Duree FROM Tache WHERE Nom = '" + task_name + "'";
        }
    }
}

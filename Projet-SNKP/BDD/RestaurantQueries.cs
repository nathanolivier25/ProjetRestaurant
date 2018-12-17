using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    public class RestaurantQueries
    {
        private static string table_group_client = "groupclient";
        private static string table_table_restaurant = "tablerestaurant";
        private static string table_tache = "Tache";
        private static string table_time_speed = "SpeedTime";
        private static string table_commande = "commande";
        private static string table_preparations = "preparation";
        private static string table_ligne_command = "lignecommande";

        public RestaurantQueries()
        {

        }

        public static string getNewGroupClient()
        {
            return "SELECT * FROM " + table_group_client + " WHERE Etat = 0;";
        }

        public static string getGroupState(int id_group)
        {
            return "SELECT Etat FROM " + table_group_client + " WHERE IDGroupe = " + id_group;
        }

        public static string getGroupInState(int state)
        {
            return "SELECT IDGroupe FROM " + table_group_client + " WHERE Etat = 6";
        }

        public static string setGroupState(int id_group, int state)
        {
            return "UPDATE " + table_group_client + " SET Etat = " + state + " WHERE IDGroupe = " + id_group;
        }

        public static string setGroupStateToUnavailable(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = -1 WHERE IDGroupe = " + id_group;
        }

        public static string setGroupStateToWelcomed(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 1 WHERE IDGroupe = " + 
                id_group.ToString() + ";";
        }

        public static string setGroupStateToInstalled(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 2 WHERE IDGroupe = " + id_group;
        }

        public static string setGroupStateToTakeCommand(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 4 WHERE IDGroupe = " + id_group;
        }

        public static string setGroupStateToOrder(int id_group)
        {
            return "UPDATE " + table_group_client + " SET Etat = 5 WHERE IDGroupe = " + id_group;
        }

        public static string getNbClientInGroup(int id_group)
        {
            return "SELECT NombreClient FROM " + table_group_client + " WHERE IDGroupe = " + id_group.ToString() + ";";
        }

        public static string getFreeTable(int nb_clients)
        {
            return "SELECT IDTable FROM " + table_table_restaurant + " WHERE EtatTable = 0 AND NbrPlacesTable >= " + 
                nb_clients.ToString() + " ORDER BY NbrPlacesTable;";
        }

        public static string setTableOccupied(int id_table)
        {
            return "UPDATE " + table_table_restaurant + " SET EtatTable = 1 WHERE IDTable = " + 
                id_table.ToString() + ";";
        }

        public static string setTableFree(int id_table)
        {
            return "UPDATE " + table_table_restaurant + " SET EtatTable = 0 WHERE IDTable = " +
                id_table.ToString() + ";";
        }

        public static string setGroupTable(int id_group, int id_table)
        {
            return "UPDATE " + table_group_client + " SET IDTable = " + id_table + " WHERE IDGroupe = " + id_group;
        }

        public static string getGroupTable(int id_group)
        {
            return "SELECT IDTable FROM " + table_group_client + " WHERE IDGroupe = " + id_group;
        }

        public static string getWaiterTables(int id_carre)
        {
            return "SELECT IDTable FROM " + table_table_restaurant + " WHERE IDCarre = " + id_carre;
        }

        public static string getCustomersToPlace(int carre)
        {
            return "SELECT " + table_group_client + ".IDGroupe, " + table_group_client + ".IDTable FROM " + table_group_client +
                " INNER JOIN " + table_table_restaurant + " ON " + table_group_client + ".IDTable = " + table_table_restaurant +
                ".IDTable WHERE " + table_group_client + ".Etat = 1 AND " + table_table_restaurant + ".IDCarre = " + carre + ";";
        }

        public static string setTableGroupID(int id_table, int id_group)
        {
            return "UPDATE " + table_table_restaurant + " SET IDGroup = " + id_group + " WHERE IDTable = " + id_table;
        }

        public static string setTableGroupIDToNull(int id_table)
        {
            return "UPDATE " + table_table_restaurant + " SET IDGroup = NULL WHERE IDTable = " + id_table;
        }

        /*public static string getTaskDuration(string task_name)
        {
            return "SELECT DureeTache * 1000 * (SELECT Speed FROM " + table_time_speed + 
                " WHERE ID = 1) FROM Tache WHERE NomTache = '" + task_name + "';";
        }*/

        public static string getTaskDuration(string task_name)
        {
            return "SELECT DureeTache FROM Tache WHERE NomTache = '" + task_name + "';";
        }

        public static string getCommandToTake(int carre)
        {
            return "SELECT IDGroupe, " + table_group_client + ".IDTable FROM " + table_group_client +
                " INNER JOIN " + table_table_restaurant + " ON " + table_table_restaurant + ".IDTable = " 
                + table_group_client + ".IDTable WHERE Etat = 4 AND IDCarre = " + carre;
        }

        public static string createCommand(int id_table)
        {
            return "INSERT INTO " + table_commande + "(IDTable) VALUES (" + id_table + ");";
        }

        public static string getCommandID(int id_table)
        {
            return "SELECT NumeroCommande FROM " + table_commande + " WHERE StatutCommande = 0;";
        }

        public static string setCommandIDToOrdered(int id_command)
        {
            return "UPDATE " + table_commande + " SET StatutCommande = 1 WHERE NumeroCommande = " + id_command;
        }

        public static string getPreparations()
        {
            return "SELECT * FROM " + table_preparations;
        }

        public static string addAppetizer(int id_command, int id_preparation)
        {
            return "INSERT INTO " + table_ligne_command + "(IDPreparation, NumeroCommande, QuantiteRecette, CategorieRecette) VALUES(" +
                id_preparation + ", " + id_command + ", 1, 1);";
        }

        public static string addMainCourse(int id_command, int id_preparation)
        {
            return "INSERT INTO " + table_ligne_command + "(IDPreparation, NumeroCommande, QuantiteRecette, CategorieRecette) VALUES(" +
                id_preparation + ", " + id_command + ", 1, 2);";
        }

        public static string addDessert(int id_command, int id_preparation)
        {
            return "INSERT INTO " + table_ligne_command + "(IDPreparation, NumeroCommande, QuantiteRecette, CategorieRecette) VALUES(" +
                id_preparation + ", " + id_command + ", 1, 3);";
        }

        public static string getGroupIDPreparations(int id_group)
        {
            return "SELECT IDPreparation FROM " + table_ligne_command + " WHERE Etat = 0 AND NumeroCommande = " +
                "(SELECT NumeroCommande FROM " + table_commande + " WHERE IDTable = (SELECT IDTable FROM " + table_group_client + 
                " WHERE IDGroupe = " + id_group + ") AND StatutCommande = 1); ";
        }
    }
}

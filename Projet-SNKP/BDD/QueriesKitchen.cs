using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    class QueriesKitchen
    {
        private string myTables;
        private string nameIngredient = null;
        List<int> recette = new List<int>();
        private string nameTool;


        //revoir avec Hugo le nom des tables et des attributs


        public string getStockIngredient() //valable pour le cuisinier et le patissier et le commis
        {
            return "SELECT * FROM Ingredient WHERE NomIngredient =" + nameIngredient;
        }

        public string getCommande()
        {
            return "SELECT * FROM Commande";
        }

        public string updateCommande()
        {
            return "UPDATE Recette SET validRecette =0 WHERE";  //revoir condition
        }

        public string getRecetteAvailable()
        {
            return "SELECT * FROM Recette WHERE valid = 1"; // revoir condition avec la quantité d'ingredients
        }
        
        public string getTool()
        {
            return "SELECT * FROM StockCuisine WHERE nom =" + nameTool+"AND available =1";
        }

        public string getPlatPret()
        {
            return "SELECT "
        }




    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    public class QueriesKitchen
    {
        private string myTables;
        private string nameIngredient = null;
        List<int> recette = new List<int>();
        private string nameTool;


        //revoir avec Hugo le nom des tables et des attributs


      /*  public string getStockIngredient() //valable pour le cuisinier et le patissier et le commis
        {
            return "SELECT * FROM Ingredient WHERE NomIngredient =" + nameIngredient;
        }*/

        public string getAvailableCommande()
        {
            return "SELECT * FROM Commande WHERE StatutCommande = 0";
        }
        public string setCommandeUnavailable(int idCommande)
        {
            return "UPDATE Commande SET StatutCommande = 1 WHERE IDCommande ="+ idCommande;
        }

        public string getIDPreparation(int numeroCommande)
        {
            return "SELECT IDPreparation FROM LigneCommande WHERE NumeroCommande =" + numeroCommande;
        }



        
        public string getTool()
        {
            return "SELECT * FROM StockCuisine WHERE nom =" + nameTool+"AND available =1";
        }





    }
}

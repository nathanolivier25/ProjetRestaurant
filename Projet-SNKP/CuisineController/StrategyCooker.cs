using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BDD;
using Model;

namespace CuisineController
{
    public class StrategyCooker : IStrategyCooker
    {
        private BDDConnection bdd_connection = null;
        private Chef chef = null;


        public StrategyCooker(BDDConnection bdd_connection, Chef chef)
        {
            this.bdd_connection = bdd_connection;
            this.chef = chef;
        }


        public override void RoleStrategy()
        {

            Preparation cookerTask = (Preparation) chef.getStrategy().attributTask(); // on prend la liste des taches a faire de LigneCommande

            List<Model.Task> tasksList = cookerTask.getTaskList();
            List<List<Model.Tool>> toolList = cookerTask.getTaskToolList();
            List<List<Model.Ingredient>> ingredientList = cookerTask.getTaskIngredientList();


            for(int i=0; i<tasksList.Count; i++)
            {
                /*
                tasksList.ElementAt(i).
                */



            }



        }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Interface;
using BDD;

namespace Model
{
    public class Preparation : IPreparation

    {
        private BDDConnection bddconnection;

        public int id;
        public String name;
        private List<Task> taskList;
        private List<List<Ingredient>> ingredientList;
        private List<List<Tool>> toolList;
        

        public Preparation(int _id,BDDConnection _bddconnection) : base(_id)
        {
            id = _id;
            bddconnection = _bddconnection;
            List<List<string>> table = bddconnection.executeQuery("SELECT * FROM Preparation WHERE IDPreparation = " + _id);
            name = table.ElementAt(0).ElementAt(1);

            initList();
        }

        private void initList()
        {
            List<List<string>> table = bddconnection.executeQuery("SELECT Preparation.IDPreparation, Preparation.NomPreparation, Necessite.IDTache, Necessite.OrdreTache, Necessite.IDIngredients, Tache.NomTache, Tache.DureeTache, Utilise.IDMateriel, Materiel.NomMateriel, Materiel.Type, Materiel.EtatMateriel FROM Materiel " +
                                                                  "RIGHT JOIN Utilise ON Materiel.IDMateriel = Utilise.IDMateriel " +
"RIGHT JOIN Tache ON Utilise.IDTache = Tache.IDTache " +
"RIGHT JOIN Necessite ON Tache.IDTache = Necessite.IDTache " +
"RIGHT JOIN Preparation ON Necessite.IDPreparation = Preparation.IDPreparation " +
"WHERE Preparation.IDPreparation = " + id + " " +
"ORDER BY Necessite.OrdreTache");

            taskList = new List<Task>();

            int lasttaskorder = 0;
            for(int i=0; i < table.Count; i++)
            {
                if(lasttaskorder != Int32.Parse(table.ElementAt(i).ElementAt(3)))
                {
                    lasttaskorder = Int32.Parse(table.ElementAt(i).ElementAt(3));
                    taskList.Add(new Task(Int32.Parse(table.ElementAt(i).ElementAt(2)), table.ElementAt(i).ElementAt(5), Int32.Parse(table.ElementAt(i).ElementAt(6))));
                }
            }

            ingredientList = new List<List<Ingredient>>();

            lasttaskorder = 0;
            for (int i = 0; i < table.Count; i++)
            {
                if (lasttaskorder != Int32.Parse(table.ElementAt(i).ElementAt(3)))
                {
                    lasttaskorder = Int32.Parse(table.ElementAt(i).ElementAt(3));

                    List<Ingredient> temp = new List<Ingredient>();

                    String stringredients = table.ElementAt(i).ElementAt(4);
                    String[] ingredients = stringredients.Split(',');

                    for(int j=0; j < ingredients.Length; j++)
                    {
                        List<List<String>> temptable = bddconnection.executeQuery("SELECT * FROM Ingredient WHERE IDIngredient = " + Int32.Parse(ingredients[j]));
                        temp.Add(new Ingredient(Int32.Parse(ingredients[j]), temptable.ElementAt(0).ElementAt(2)));
                    }

                    ingredientList.Add(temp);
                }
            }

            toolList = new List<List<Tool>>();
            lasttaskorder = 0;
            for (int i = 0; i < table.Count; i++)
            {
                if (lasttaskorder != Int32.Parse(table.ElementAt(i).ElementAt(3)))
                {
                    List<Tool> tools = new List<Tool>();
                    tools.Add(new Tool(Int32.Parse(table.ElementAt(i).ElementAt(7)),bddconnection));
                    toolList.Add(tools);
                }
                else
                {
                    toolList.ElementAt(toolList.Count - 1).Add(new Tool(Int32.Parse(table.ElementAt(i).ElementAt(7)),bddconnection));
                }

            }

        }

        public List<Task> getTaskList()
        {
            return taskList;
        }

        public List<List<Ingredient>> getTaskIngredientList()
        {
            return ingredientList;
        }

        public List<List<Tool>> getTaskToolList()
        {
            return toolList;
        }


    }
}

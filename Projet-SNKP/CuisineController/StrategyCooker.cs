using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using BDD;
using Model;

namespace CuisineController
{
    public class StrategyCooker : IStrategyCooker
    {
        private BDDConnection bdd_connection = null;
        private Chef chef = null;
        private ExchangerDesk exchangerDesk = null;
        public int taskstate = -1;
        public int taskbegintime = 0;
        public int taskendtime = 0;
        public string printstr = "";
        public Boolean cooking = false;


        public StrategyCooker(BDDConnection bdd_connection, Chef chef, ExchangerDesk _exchangerDesk)
        {
            this.bdd_connection = bdd_connection;
            this.chef = chef;
            this.exchangerDesk = _exchangerDesk;
        }


        public override void RoleStrategy()
        {

            Preparation cookerTask = (Preparation) chef.getStrategy().attributTask(); // on prend la liste des taches a faire de LigneCommande
            if (cookerTask != null)
            {
                List<Model.Task> tasksList = cookerTask.getTaskList();

                if (tasksList != null)
                {
                    Console.WriteLine("le CUISINIER commence la preparation de :" + cookerTask.name);

                    List<List<Model.Tool>> toolList = cookerTask.getTaskToolList();
                    List<List<Model.Ingredient>> ingredientList = cookerTask.getTaskIngredientList();
                    taskstate = -1;
                    taskbegintime = 0;
                    taskendtime = 0;
                    cooking = false;
                    printstr = "";

                    for (int i = 0; i < tasksList.Count; i++)
                    {
                        String logline = "le CUISINER prépare " + cookerTask.name + " - étape " + (i + 1) + "/" + tasksList.Count + ": faire " + tasksList.ElementAt(i).Name + "\n\t";
                        for (int j = 0; j < ingredientList.ElementAt(i).Count; j++)
                        {
                            logline += " " + ingredientList.ElementAt(i).ElementAt(j).Name + ",";
                        }
                        logline += " à l'aide de :\n\t";
                        for (int j = 0; j < toolList.ElementAt(i).Count; j++)
                        {
                            logline += " " + toolList.ElementAt(i).ElementAt(j).name + ",";
                        }
                        Console.WriteLine(logline);

                        taskstate = i;
                        taskbegintime = (int)Interface.Timer.getInstance().getLocalTime();
                        taskendtime = taskbegintime + tasksList.ElementAt(i).Duration;
                        cooking = false;

                        printstr = "";
                        printstr += cookerTask.name + "\n";
                        printstr += (i + 1) + "/" + tasksList.Count + " - " + "faire " + tasksList.ElementAt(i).Name + "\n";
                        printstr += "->";
                        for (int j = 0; j < ingredientList.ElementAt(i).Count; j++)
                        {
                            printstr += " " + ingredientList.ElementAt(i).ElementAt(j).Name + ",";
                        }
                        printstr += "\n";
                        printstr += "->";
                        for (int j = 0; j < toolList.ElementAt(i).Count; j++)
                        {
                            printstr += " " + toolList.ElementAt(i).ElementAt(j).name + ",";
                        }
                        printstr += "\n";



                        for (int j=0; j<toolList.ElementAt(i).Count ; j++)
                        {
                            if (toolList.ElementAt(i).ElementAt(j).name.Contains("Four") ||
                                toolList.ElementAt(i).ElementAt(j).name.Contains("Feu de cuisson") ||
                                toolList.ElementAt(i).ElementAt(j).name.Contains("Autocuiseur") ||
                                toolList.ElementAt(i).ElementAt(j).name.Contains("Friteuse") ||
                                toolList.ElementAt(i).ElementAt(j).name.Contains("Plancha") ||
                                toolList.ElementAt(i).ElementAt(j).name.Contains("Micro ondes"))
                            {
                                cooking = true;
                            }
                        }
                        

                        int actualTimeLimit = (int)Interface.Timer.getInstance().getLocalTime();
                        actualTimeLimit += tasksList.ElementAt(i).Duration;

                        while (actualTimeLimit >= (int)Interface.Timer.getInstance().getLocalTime())
                        {
                            Thread.Sleep(50);
                        }
                    }
                    Console.WriteLine("le cuisinier a FINI la préparation de : " + cookerTask.name);
                    Console.WriteLine("le cuisinier ENVOI la préparation de : " + cookerTask.name);
                    exchangerDesk.AddToDesk(cookerTask);
                }
            }
        }


    }
}

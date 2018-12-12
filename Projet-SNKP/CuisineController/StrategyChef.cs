﻿using BDD;
using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace CuisineController
{
    public class StrategyChef : IStrategyChef
    {
        private BDDConnection bdd_connection = null;
        private List<Preparation> myOrderList;
        

        public StrategyChef(BDDConnection bdd_connection)
        {
            this.bdd_connection = bdd_connection;
            myOrderList = new List<Preparation>();
            

        }



        public override void RoleStrategy()
        {
            List<List<string>> myCommands = bdd_connection.executeQuery(bdd_connection.QueriesKitchen.getAvailableCommande());
            int IDcommande = 0;
            try
            {
                IDcommande = int.Parse(myCommands[0][0]); // get id of order
                bdd_connection.executeNonQuery(bdd_connection.QueriesKitchen.setCommandeUnavailable(IDcommande));

                //Console.WriteLine("...");

            }
            catch (ArgumentOutOfRangeException)
            {
                return;
            }
            // recup of numero command toeic/20
            myCommands = bdd_connection.executeQuery(bdd_connection.QueriesKitchen.getIDPreparation(IDcommande));
            int NumeroPreparation = int.Parse(myCommands[0][0]);
            Console.WriteLine(NumeroPreparation);
            this.myOrderList.Add(new Preparation(NumeroPreparation, bdd_connection)); // stock la liste des préparation
        }
        
        public override IPreparation attributTask() // va permettre de donner la liste au cuisinier
        {
            if (myOrderList.Count ==0)
            {
                return null;
            }
            else
            {
                Preparation LigneCommande = myOrderList.ElementAt(0);
                myOrderList.RemoveAt(0);
                return LigneCommande;
            }

        }

        
    }
}

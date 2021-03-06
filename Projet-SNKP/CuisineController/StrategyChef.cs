﻿using BDD;
using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using Model;

namespace CuisineController
{
    public class StrategyChef : IStrategyChef
    {
        private BDDConnection bdd_connection = null;
        public List<Preparation> myOrderList;
        private ExchangerDesk exchangerDesk;
        

        public StrategyChef(BDDConnection bdd_connection, ExchangerDesk _exchangerDesk)
        {
            this.bdd_connection = bdd_connection;
            myOrderList = new List<Preparation>();
            exchangerDesk = _exchangerDesk;

        }



        public override void RoleStrategy()
        {
            /*
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
            Console.WriteLine("communication:" + NumeroPreparation);
            this.myOrderList.Add(new Preparation(NumeroPreparation, bdd_connection)); // stock la liste des préparation
            */

            List<TransferableItemDecorator> temp = exchangerDesk.CheckDesk();

            if(temp.Count > 0)
            {
                TransferableItemDecorator secure = temp.ElementAt(0);
                if (secure != null)
                {
                    Preparation tempPreparation = new Preparation(secure.getId(), this.bdd_connection);
                    Console.WriteLine("Reception par le CHEF de la commande de : " + tempPreparation.name + " n°" + tempPreparation.id);
                    exchangerDesk.RemoveFromDesk(0);
                    this.myOrderList.Add(tempPreparation);
                }
            }


        }

        [MethodImpl(MethodImplOptions.Synchronized)]
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

                Console.WriteLine("Attribution par le CHEF de la commande :" + LigneCommande.name + " n°" + LigneCommande.id);

                return LigneCommande;
            }

        }

        
    }
}

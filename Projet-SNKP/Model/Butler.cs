using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using SalleController;


namespace Model
{
    public class Butler : People
    {
        IStrategyButler strategy;

        public Butler(IStrategyButler givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
            this.Thread = new Thread(new ThreadStart(ThreadLoop));
            this.BDDConnection = bdd_connection;
        }

        public void ThreadLoop()
        {
            StrategyButler strategy_butler = new StrategyButler(this.BDDConnection);
            //strategy_butler.BDDConnection = this.BDDConnection;
            while (this.Thread.IsAlive)
            {
                int id_group = strategy_butler.RoleStrategy();
                if (id_group != 0) // If a new group come in
                {
                    // Creation of a new client group
                    ClientGroup group_client = (ClientGroup)new FactoryPeople()
                        .createStaff(FactoryPeople.paramStaff.ClientGroup, this.BDDConnection);

                    // Set the client group ID
                    group_client.IDGroup = id_group;

                    // Get the number of client in the group
                    int nb_clients = strategy_butler.getNbClientsInGroup(id_group);
                    group_client.NbClients = nb_clients;

                    // Choose a table for the group
                    group_client.IDTable = strategy_butler.chooseTable(nb_clients);

                    // Set the table to the occupied statut


                    group_client.ToString();
                }
            }
        }
    }
}

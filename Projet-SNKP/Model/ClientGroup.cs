using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using Interface;

namespace Model
{
    public class ClientGroup : People
    {
        Command command;
        IStrategyClientGroup strategy;

        int id_group = 0;
        int nb_clients = 0;
        int id_table = 0;

        public ClientGroup(IStrategyClientGroup givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
            this.Thread = new Thread(new ThreadStart(ThreadLoop));
        }

        public void ThreadLoop()
        {
            StrategyClientGroup strategy_client_group = new StrategyClientGroup();
            strategy_client_group.BDDConnection = this.BDDConnection;
            while (this.Thread.IsAlive)
            {
                strategy_client_group.RoleStrategy();
            }
        }

        public int IDGroup
        {
            get { return this.id_group; }
            set { this.id_group = value; }
        }

        public int NbClients
        {
            get { return this.nb_clients; }
            set { this.nb_clients = value; }
        }

        public int IDTable
        {
            get { return this.id_table; }
            set { this.id_table = value; }
        }

        public void ToString()
        {
            Console.WriteLine("New group");
            Console.WriteLine("ID group : " + this.id_group);
            Console.WriteLine("Nb clients : " + this.nb_clients);
            Console.WriteLine("ID table : " + this.id_table);
        }
    }
}

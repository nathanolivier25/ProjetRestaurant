using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalleController
{
    public class StrategyButler : IStrategyButler
    {
        private BDDConnection bdd_connection = null;

        public StrategyButler()
        {
            
        }

        public BDDConnection BDDConnection
        {
            set { this.bdd_connection = value; }
        }

        public override void RoleStrategy()
        {
            this.bdd_connection.executeQuery("SELECT * FROM GroupClient WHERE Etat = 0;");
            if (this.bdd_connection.hasData())
            {
                Console.WriteLine("New group");
                int id_group = this.bdd_connection.Data.GetInt32(0);
                this.bdd_connection.executeNonQuery("UPDATE GroupClient SET Etat = 1 WHERE ID = " +
                    id_group.ToString() + ";");
            }
        }
    }
}

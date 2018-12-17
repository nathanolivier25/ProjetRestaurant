using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace SalleController
{
    public class StrategyWaiter : IStrategyWaiter
    {
        private BDDConnection bdd_connection = null;

        public StrategyWaiter(BDDConnection bdd_connection)
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
        }

        public override void RoleStrategy()
        {
            List<List<string>> list_clients = this.bdd_connection.executeQuery(RestaurantQueries.getGroupInState(6));
            if(list_clients.Count > 0)
            {
                ConsoleDisplayer.display("Le serveur apporte du pain et de l'eau au groupe " + list_clients[0][0]);
                this.bdd_connection.executeNonQuery(RestaurantQueries.setGroupState(int.Parse(list_clients[0][0]), 7));
            }
        }
    }
}

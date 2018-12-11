using BDD;
using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CuisineController
{
    public class StrategyChef:IStrategyChef
    {
        private BDDConnection bdd_connection = null;

        public StrategyChef()
        {

        }



        public override void RoleStrategy()
        {
            this.bdd_connection.executeQuery(RestaurantQueries.getNewGroupClient());
            if (this.bdd_connection.hasData())
            {
                Console.WriteLine("New group");
                int id_group = this.bdd_connection.Data.GetInt32(0);
                this.bdd_connection.executeNonQuery(
                    RestaurantQueries.setGroupStateToWelcomed(id_group));
            }
        }



    }
}

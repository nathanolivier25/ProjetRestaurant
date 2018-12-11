using BDD;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Launcher
{
    class RestaurantLauncher
    {
        private BDDConnection bdd_connection = null;

        public RestaurantLauncher()
        {
            /*
            GUI.SnkpGUI window = new GUI.SnkpGUI(1);
            window.run();
            */

            this.openBDDConnection();

            this.startPeople();

        }

        public void openBDDConnection()
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "Test");
        }


        public void startPeople()
        {
            // Instanciate the butler
            Butler butler = new Butler(new SalleController.StrategyButler(this.bdd_connection), this.bdd_connection);

            // Instanciate chef

            // ...
        }

        public void closeBDDConnection()
        {
            this.bdd_connection.close();
        }
    }
}

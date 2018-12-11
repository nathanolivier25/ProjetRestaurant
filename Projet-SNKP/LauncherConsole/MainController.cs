using BDD;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LauncherConsole
{
    class MainController
    {
        private BDDConnection bdd_connection = null;

        public MainController()
        {
            //this.launchGUI();
            this.openBDDConnection();

            this.startPeople();

            //this.closeBDDConnection();
        }

        public void openBDDConnection()
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "Test");
            //bdd_connection.close();
        }

        public void launchGUI()
        {
            GUI.SnkpGUI window = new GUI.SnkpGUI(1);

            window.run();
        }

        public void startPeople()
        {
            // Create de people factory
            FactoryPeople factory_people = new FactoryPeople();

            // Instanciate the butler
            Butler butler = (Butler)factory_people.createStaff(FactoryPeople.paramStaff.Butler);
            butler.BDDConnection = this.bdd_connection;
            butler.Thread.Start();

            // Instanciate chef
        }

        public void closeBDDConnection()
        {
            this.bdd_connection.close();
        }
    }
}

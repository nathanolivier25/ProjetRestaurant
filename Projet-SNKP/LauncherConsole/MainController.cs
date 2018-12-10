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

            FactoryPeople factory_people = new FactoryPeople();
            Butler butler = (Butler)factory_people.createStaff(FactoryPeople.paramStaff.Butler);
            butler.BDDConnection = this.bdd_connection;
            butler.Thread.Start();

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

        public void closeBDDConnection()
        {
            this.bdd_connection.close();
        }
    }
}

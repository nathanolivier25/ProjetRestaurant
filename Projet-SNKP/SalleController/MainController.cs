using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalleController
{
    class MainController
    {
        public MainController()
        {
            this.launchGUI();
            this.openBDDConnection();
        }

        public void openBDDConnection()
        {
            BDDConnection bdd_connection = new BDDConnection("SÉBASTIEN", "Test");
            bdd_connection.close();
        }

        public void launchGUI()
        {
            GUI.SnkpGUI window = new GUI.SnkpGUI(1);

            window.run();
        }
    }
}

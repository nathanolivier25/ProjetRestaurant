using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

using TCP;
using GUI;
using BDD;
using Model;
using CuisineController;

namespace Launcher
{
    class KitchenLauncher
    {
        TCP.TCP tempCuisine = null;

        TCP.TCP tcp = null;
        BDDConnection bdd_connection = null;
        SnkpGUI snkpgui = null;

        Chef chef = null;
        Cooker cooker1 = null;
        Cooker cooker2 = null;
        ExchangerDesk desk = null;


        public KitchenLauncher()
        {

            launchTestTCP();
            this.tcp = new TCP.TCP(TCP.TCP.Mode.Serveur, "127.0.0.1");

            this.bdd_connection = new BDDConnection("LAPTOP-N7TCCQGD", "ProgSystem");

            this.desk = new ExchangerDesk(this.tcp, Side.Kitchen);

            this.chef = new Chef(new StrategyChef(this.bdd_connection, this.desk), this.bdd_connection);

            this.cooker1 = new Cooker(new StrategyCooker(this.bdd_connection, this.chef, this.desk), this.bdd_connection);
            this.cooker2 = new Cooker(new StrategyCooker(this.bdd_connection, this.chef, this.desk), this.bdd_connection);

            List<People> persons = new List<People>();

            persons.Add(chef);
            persons.Add(cooker1);
            persons.Add(cooker2);

            snkpgui = new SnkpGUI(false, persons);
            snkpgui.run();

            
        }




        private void launchTestTCP()
        {
            Thread thread = new Thread(new ThreadStart(TestTCPMain));
            thread.Start();
            Thread.Sleep(100);
        }

        private void TestTCPMain()
        {
            this.tempCuisine = new TCP.TCP(TCP.TCP.Mode.Client, "127.0.0.1");
            while (true)
            {
                int clock = Interface.Timer.getInstance().getLocalTime();
                while (clock + 180 > Interface.Timer.getInstance().getLocalTime())
                {
                    Thread.Sleep(50);
                }
                this.tempCuisine.write("p12");
                this.tempCuisine.write("p13");
                this.tempCuisine.write("p14");
            }
        }

    }
}

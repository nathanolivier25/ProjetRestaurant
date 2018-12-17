using BDD;
using GUI;
using Interface;
using Model;
using PropertiesWindow;
using SalleController;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using TCP;

namespace Launcher
{
    class RestaurantLauncher
    {
        private BDDConnection bdd_connection = null;
        private Interface.Timer timer = null;

        public RestaurantLauncher()
        {
            //this.launchGUI();

            this.startTimer();

            this.openBDDConnection();

            this.startPeople();

            WindowLauncher properties_window = new WindowLauncher();
        }

        public void launchGUI()
        {
            //SnkpGUI window = new SnkpGUI(1);
            //window.run();
        }

        public void startTimer()
        {
            this.timer = Interface.Timer.getInstance();
            this.timer.Mode = 1;
        }

        public void openBDDConnection()
        {
            this.bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
        }


        public void startPeople()
        {
            // Instanciate
            Thread thread = new Thread(new ThreadStart(TCPConnect));
            thread.Start();

            ExchangerDesk exchanger_desk = new ExchangerDesk(new TCP.TCP(TCP.TCP.Mode.Client), Side.Room);
            HeadWaiter.ExchangerDesk = exchanger_desk;

            // Instanciate the butler
            Butler butler = new Butler(new StrategyButler(this.bdd_connection), this.bdd_connection);
            Butler.Timer = this.timer;

            // Instanciate HeadWaiters
            HeadWaiter head_waiter_1 = new HeadWaiter(new StrategyHeadWaiter(), this.bdd_connection, 1);
            HeadWaiter head_waiter_2 = new HeadWaiter(new StrategyHeadWaiter(), this.bdd_connection, 2);

            // Instanciate the waiters
            Waiter waiter = new Waiter(new StrategyWaiter(this.bdd_connection), this.bdd_connection, 1);
        }

        public void closeBDDConnection()
        {
            this.bdd_connection.close();
        }

        public void TCPConnect()
        {
            ExchangerDesk exchanger_desk = null;
            exchanger_desk = new ExchangerDesk(new TCP.TCP(TCP.TCP.Mode.Serveur), Side.Kitchen);
        }
    }
}

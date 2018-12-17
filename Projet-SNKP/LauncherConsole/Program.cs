using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Launcher
{
    class Program
    {
        static void Main(string[] args)
        {
            Thread thread_kitchen = new Thread(new ThreadStart(ThreadKitchen));
            thread_kitchen.Start();
            new RestaurantLauncher();
        }

        static public void ThreadKitchen()
        {
            new KitchenLauncher();
        }
    }
}

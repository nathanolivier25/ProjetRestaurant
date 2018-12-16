using BDD;
using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Model
{
    public class Cooker : People
    {
        public IStrategyCooker strategy;

        public Cooker(IStrategyCooker givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            Console.WriteLine("Le CUISINIER vient d'arriver au restaurant");

            strategy = givenStrategy;
            this.Thread = new Thread(new ThreadStart(ThreadLoop));
            this.Thread.Start();
        }



        public void ThreadLoop()
        {
            while (this.Thread.IsAlive)
            {
                strategy.RoleStrategy();
            }

        }

    }
}

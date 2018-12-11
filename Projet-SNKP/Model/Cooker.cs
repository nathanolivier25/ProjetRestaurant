using BDD;
using CuisineController;
using Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Cooker : People
    {
        IStrategyCooker strategy;

        public Cooker(IStrategyCooker givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
        }

    }
}

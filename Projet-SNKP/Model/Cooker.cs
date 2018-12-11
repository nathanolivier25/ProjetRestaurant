using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;

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

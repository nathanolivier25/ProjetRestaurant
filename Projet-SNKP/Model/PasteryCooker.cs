using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;

namespace Model
{
    public class PasteryCooker: Cooker
    {
        IStrategyPasteryCooker strategy;

        public PasteryCooker(IStrategyPasteryCooker givenStrategy, IStrategyCooker cooker, BDDConnection bdd_connection) 
            :base(cooker, bdd_connection)
        {
            strategy = givenStrategy;
        }
    }
}

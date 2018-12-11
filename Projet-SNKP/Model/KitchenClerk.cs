using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;

namespace Model
{
    public class KitchenClerk : People
    {
        IStrategyKitchenClerk strategy;

        public KitchenClerk(IStrategyKitchenClerk givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
        }
    }
}

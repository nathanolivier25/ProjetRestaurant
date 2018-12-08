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

        public KitchenClerk(IStrategyKitchenClerk givenStrategy)
        {
            strategy = givenStrategy;
        }
    }
}

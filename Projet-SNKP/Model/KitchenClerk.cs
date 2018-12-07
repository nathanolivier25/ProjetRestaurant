using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cuisine;

namespace ModelConsole
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace ModelConsole
{
    public class Clerk : People
    {
        IStrategyClerk strategy;

        public Clerk(IStrategyClerk givenStrategy)
        {
            strategy = givenStrategy;
        }
    }
}

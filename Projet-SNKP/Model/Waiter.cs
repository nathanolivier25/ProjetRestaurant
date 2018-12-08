using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace Model
{
    public class Waiter: People
    {
        IStrategyWaiter strategy;

        public Waiter(IStrategyWaiter givenStrategy)
        {
            strategy = givenStrategy;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace ModelConsole
{
    public class HeadWaiter : People
    {
        IStrategyHeadWaiter strategy;

        public HeadWaiter(IStrategyHeadWaiter givenStrategy)
        {
            strategy = givenStrategy;
        }



    }
}

using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace Model
{
    public class HeadWaiter : People
    {
        IStrategyHeadWaiter strategy;

        public HeadWaiter(IStrategyHeadWaiter givenStrategy, BDDConnection bdd_connection): base(bdd_connection)
        {
            strategy = givenStrategy;
        }



    }
}

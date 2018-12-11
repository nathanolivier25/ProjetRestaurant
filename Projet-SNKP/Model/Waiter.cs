using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace Model
{
    public class Waiter: People
    {
        IStrategyWaiter strategy;

        public Waiter(IStrategyWaiter givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
        }
    }
}

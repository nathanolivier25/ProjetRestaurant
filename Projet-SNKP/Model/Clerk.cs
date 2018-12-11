using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace Model
{
    public class Clerk : People
    {
        IStrategyClerk strategy;

        public Clerk(IStrategyClerk givenStrategy, BDDConnection bdd_connection) : base(bdd_connection)
        {
            strategy = givenStrategy;
        }
    }
}

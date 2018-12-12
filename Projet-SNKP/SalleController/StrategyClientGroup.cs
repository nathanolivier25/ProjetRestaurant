using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace SalleController
{
    public class StrategyClientGroup : IStrategyClientGroup
    {
        private BDDConnection bdd_connection = null;

        public StrategyClientGroup(BDDConnection bdd_connection = null)
        {
            this.bdd_connection = bdd_connection;
        }

        public override void RoleStrategy()
        {
            
        }
    }
}

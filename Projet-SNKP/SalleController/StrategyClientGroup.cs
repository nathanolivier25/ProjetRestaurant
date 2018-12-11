using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalleController
{
    public class StrategyClientGroup : IStrategyClientGroup
    {
        private BDDConnection bdd_connection = null;

        public StrategyClientGroup()
        {

        }

        public override void RoleStrategy()
        {

        }

        public BDDConnection BDDConnection
        {
            get { return this.bdd_connection; }
            set { this.bdd_connection = value; }
        }
    }
}

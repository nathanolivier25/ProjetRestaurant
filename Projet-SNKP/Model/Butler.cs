using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace Model
{
    public class Butler : People
    {

        IStrategyButler strategy;

        public Butler(IStrategyButler givenStrategy)
        {
            strategy = givenStrategy;
        }


    }
}

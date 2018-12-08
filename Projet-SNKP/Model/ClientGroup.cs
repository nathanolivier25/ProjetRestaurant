using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalleController;

namespace Model
{
    public class ClientGroup : People
    {
        Command command;
        IStrategyClientGroup strategy;

        public ClientGroup(IStrategyClientGroup givenStrategy)
        {
            strategy = givenStrategy;
        }

    }
}

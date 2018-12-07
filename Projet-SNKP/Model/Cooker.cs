using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cuisine;

namespace ModelConsole
{
    public class Cooker : People
    {
        IStrategyCooker strategy;

        public Cooker(IStrategyCooker givenStrategy)
        {
            strategy = givenStrategy;
        }

    }
}

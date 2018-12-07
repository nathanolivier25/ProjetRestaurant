﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cuisine;

namespace ModelConsole
{
    public class PasteryCooker: Cooker
    {
        IStrategyPasteryCooker strategy;

        public PasteryCooker(IStrategyPasteryCooker givenStrategy, IStrategyCooker cooker):base(cooker)
        {
            strategy = givenStrategy;
        }
    }
}

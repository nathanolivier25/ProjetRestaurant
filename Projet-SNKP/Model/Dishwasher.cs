using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;

namespace Model
{
    public class Dishwasher : People
    {
        IStrategyDishwasher strategy;

        public Dishwasher(IStrategyDishwasher givenStrategy)
        {
            strategy = givenStrategy;
        }
    }
}

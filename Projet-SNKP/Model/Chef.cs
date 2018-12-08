using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CuisineController;


namespace Model
{
  public class Chef : People
    {
        IStrategyChef strategy;

        public Chef(IStrategyChef givenStrategy)
        {
            strategy = givenStrategy;
        }



    }
}

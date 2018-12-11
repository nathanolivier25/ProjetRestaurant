using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace Model
{
    public class PasteryCooker: Cooker
    {

        public PasteryCooker(IStrategyPasteryCooker givenStrategy, BDDConnection bdd_connection) 
            :base(givenStrategy, bdd_connection)
        {

        }
    }
}

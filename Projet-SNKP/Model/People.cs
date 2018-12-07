using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelConsole
{
    public class People
    {
        private string name;
        private string role;
        private string state;
        private Restaurant restaurantReference;

        public People()
        {
            name = null;
            role = null;
            state = null;
            restaurantReference = new Restaurant();


        }

        public virtual void RoleStrategy()
        {

        }





    }
}

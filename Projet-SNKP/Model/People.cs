using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Model
{
    public class People
    {
        private string name;
        private string role;
        private string state;
        private Restaurant restaurantReference;
        private Thread thread = null;

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

        public Thread Thread
        {
            get { return this.thread; }
            set { this.thread = value; }
        }
    }
}

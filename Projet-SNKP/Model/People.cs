using BDD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Model
{
    public class People
    {
        public enum Job { Chef,Cooker,Dishwasher,KitchenClerk,PasteryCooker,Butler,Clerk,ClientGroup,HeadWaiter,Waiter}

        protected string name;
        protected string role;
        protected string state;
        protected Restaurant restaurantReference;
        protected Thread thread = null;
        protected BDDConnection bdd_connection = null;

        public People(BDDConnection bdd_connection)
        {
            name = null;
            role = null;
            state = null;
            this.bdd_connection = bdd_connection;
            restaurantReference = new Restaurant();
        }

        public virtual void RoleStrategy()
        {

        }

        public BDDConnection BDDConnection
        {
            get { return this.bdd_connection; }
            set { this.bdd_connection = value; }
        }

        public Thread Thread
        {
            get { return this.thread; }
            set { this.thread = value; }
        }
    }
}

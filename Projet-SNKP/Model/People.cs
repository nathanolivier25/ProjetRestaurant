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
        private string name;
        private string role;
        private string state;
        private Restaurant restaurantReference;
        private Thread thread = null;
        private BDDConnection bdd_connection = null;

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

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDD
{
    public class Queries
    {
        private string table_group_client = "GroupClient";
        private string table_table_restaurant = "TableRestaurant";

        public Queries()
        {

        }

        public string getNewGroupClient()
        {
            return "SELECT * FROM " + table_group_client + " WHERE Etat = 0;";
        }

        public string setGroupStateToWelcomed(int id_group)
        {
            return "UPDATE " + table_table_restaurant + " SET Etat = 1 WHERE ID = " + 
                id_group.ToString() + ";";
        }
    }
}
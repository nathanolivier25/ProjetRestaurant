using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Ingredient
    {
        private int id;
        private String name;

        public Ingredient(int _id, String _name)
        {
            name = _name;
            id = _id;
        }


        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Name
        {
            get { return name; }
            set { name = value;  }
        }

    }
}

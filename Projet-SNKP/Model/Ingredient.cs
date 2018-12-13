using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Ingredient
    {
        private int id { get; set; }
        private String name { get; set; }

        public Ingredient(int _id, String _name)
        {
            name = _name;
            id = _id;

        }

    }
}

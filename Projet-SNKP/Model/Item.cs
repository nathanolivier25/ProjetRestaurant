using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Item
    {
        int id;

        public Item(int _id)
        {
            id = _id;
        }

        public String toString()
        {
            return "" + id;
        }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Task
    {
        private int id { get; set; }
        private string name { get; set; }
        private int duration { get; set; }

        public Task(int _id, String _name, int _duration)
        {
            id = _id;
            name = _name;
            duration = _duration;
        }




    }
}

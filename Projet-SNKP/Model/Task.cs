using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Task
    {
        private int id;
        private string name;
        private int duration;

        public Task(int _id, String _name, int _duration)
        {
            id = _id;
            name = _name;
            duration = _duration;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int Duration
        {
            get { return duration; }
            set { duration = value; }
        }



    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TCP;


namespace Model
{
    public class ExchangerDesk
    {
        private TCP.TCP connection;
        private List<Item> inputBuffer;

        private Side side;

        private Thread thread;
        private bool threadIsRunning;
        

        public ExchangerDesk(TCP.TCP _connection,Side _side)
        {
            connection = _connection;
            side = _side;
            inputBuffer = new List<Item>();

            thread = new Thread(new ThreadStart(threadMain));
            thread.Start();
        }

        private void threadMain()
        {
            threadIsRunning = true;
            while (threadIsRunning)
            {
                
            }
        }

        public void AddToDesk(Item i)
        {
            inputBuffer.Add(i);
        }

        public List<Item> CheckDesk()
        {
            return inputBuffer;
        }


        public void RemoveFromDesk(int key)
        {
            inputBuffer.RemoveAt(key);
        }

        public void RemoveFromDesk(Item i)
        {
            inputBuffer.Remove(i);
        }

        public void close()
        {
            threadIsRunning = false;
        }


    }
}

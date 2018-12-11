﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;

using TCP;


namespace Model
{
    public class ExchangerDesk
    {
        private TCP.TCP connection;
        private List<Item> inputBuffer;
        private List<Item> sendBuffer;

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
                if(sendBuffer.Count >= 1)
                {
                    connection.write(sendBuffer.ElementAt(0).toString());
                }

                String str = connection.read();
                if(str.Length >= 0)
                {
                    inputBuffer.Add(new Item(Int32.Parse(str)));
                }
            }
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public void AddToDesk(Item i)
        {
            sendBuffer.Add(i);
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public List<Item> CheckDesk()
        {
            return inputBuffer;
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public void RemoveFromDesk(int key)
        {
            inputBuffer.RemoveAt(key);
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public void RemoveFromDesk(Item i)
        {
            inputBuffer.Remove(i);
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public void close()
        {
            threadIsRunning = false;
        }


    }
}
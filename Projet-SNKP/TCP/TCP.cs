using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Runtime.CompilerServices;

namespace TCP
{
    class TCP
    {
        public enum Mode { Client = 1, Serveur = 2}

        private Thread thread;

        private String address;
        private int port;
        private Mode mode;

        private TcpClient client;
        private NetworkStream ns;

        private String inputBuffer;

        public TCP(Mode local, String targetaddress = "localhost", int targetport = 4567)
        {
            address = targetaddress;
            port = targetport;
            mode = local;
            client = null;
            ns = null;

            thread = new Thread(threadMain);
        }

        private void threadMain()
        {
            waitForConnect();
            while (thread.IsAlive)
            {
                inputBuffer = receiveData();
            }
        }

        private void waitForConnect()
        {
            if(this.mode == Mode.Serveur)
            {
                TcpListener listener = null;
                Console.WriteLine("as server");
                try
                {
                    listener = TcpListener.Create(port);
                    listener.Start();
                    client = listener.AcceptTcpClient();
                    ns = client.GetStream();
                }
                catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                }
                finally
                {
                    listener.Stop();
                }
            }
            else
            {
                Console.WriteLine("as client");
                try
                {
                    client = new TcpClient(address, port);
                    ns = client.GetStream();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        private String receiveData()
        {
            Byte[] bytes = new Byte[256];
            String data = null;
            String toreturn = "";
            int i;

            while ((i = ns.Read(bytes, 0, bytes.Length)) != 0)
            {
                data = System.Text.Encoding.ASCII.GetString(bytes, 0, i);
                Console.WriteLine("Received: {0}", data);
                toreturn += data;
            }
            return toreturn;
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public String read()
        {
            String toreturn = "";

            String[] inputArray = inputBuffer.Split('\n');

            if(inputArray.Length >= 2)
            {
                toreturn = inputArray[0];
                inputBuffer = "";
                for (int i=1; i<inputArray.Length; i++)
                {
                    inputBuffer += inputArray[i];
                    inputBuffer += "\n";
                }
            }

            return "fapoz";
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public void write(String data)
        {
            data += '\n';
            byte[] msg = System.Text.Encoding.ASCII.GetBytes(data);

            ns.Write(msg, 0, msg.Length);
            Console.WriteLine("Sent: {0}", data);
        }


    }
}

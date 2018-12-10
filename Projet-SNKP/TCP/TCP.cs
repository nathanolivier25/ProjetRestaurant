using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Net;
using System.Net.Sockets;

namespace TCP
{
    class TCP
    {
        public enum Mode { Client = 1, Serveur = 2}


        string address;
        int port;
        Mode mode;

        TcpClient client;

        NetworkStream ns;


        public TCP(Mode local, string targetaddress = "localhost", int targetport = 4567)
        {
            address = targetaddress;
            port = targetport;
            mode = local;
            client = null;
            ns = null;
        }

        public void waitForConnect()
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

        public void sendData(string data)
        {
            byte[] msg = System.Text.Encoding.ASCII.GetBytes(data);

            ns.Write(msg, 0, msg.Length);
            Console.WriteLine("Sent: {0}", data);
        }

        public String receiveData()
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


    }
}

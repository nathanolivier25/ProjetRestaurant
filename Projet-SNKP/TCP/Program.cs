using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TCP
{
    class Program
    {
        static void Main(string[] args)
        {

            TCP test = new TCP(TCP.Mode.Client, "10.144.50.1");
            Console.WriteLine("test");
            test.waitForConnect();
            test.sendData("Bonjour depuis le serveur");

            while (true)
            {
                test.receiveData();
            }

        }
    }
}

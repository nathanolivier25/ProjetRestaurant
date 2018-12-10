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

            TCP test = new TCP(TCP.Mode.Serveur, "127.0.0.1");
            Console.WriteLine("test");

            test.write("Bonjour je suis le serveur");
            test.write("Bonjour de nouveau");

            while (true)
            {
                String input = test.read();
                if(input.Length >= 2)
                {
                    Console.WriteLine(input);
                }
            }


        }
    }
}

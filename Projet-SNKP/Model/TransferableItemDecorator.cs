using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Interface;

namespace Model
{
    public class TransferableItemDecorator : ITransferableItemDecorator
    {
        public enum Type { Preparation = 'p', Tool = 't'}

        Type type;
        int id;

        public TransferableItemDecorator(int _id, Type _type)
        {
            id = _id;
            type = _type;
        }

        public TransferableItemDecorator(String str)
        {
            char c = str.ElementAt(0);
            int i = Int32.Parse(str.Substring(1));

            if(c == 'p')
            {
                type = Type.Preparation;
                id = i;
            }
            else if(c == 't')
            {
                type = Type.Tool;
                id = i;
            }
            else
            {
                Console.WriteLine("TRANSFERABLE ITEM PARSING FAILURE");
            }

        }

        public override String toString()
        {
            return ("" + (char)type + id);
        }


    }
}

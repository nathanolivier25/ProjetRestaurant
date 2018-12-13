using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Interface;

namespace Model
{
    public class Tool : TransferableItemDecorator
    {
        public Tool(int id) : base(id, TransferableItemDecorator.Type.Tool)
        {

        }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interface
{
    public abstract class IPreparation : TransferableItemDecorator
    {
        public IPreparation(int _id) : base(_id, Type.Preparation)
        {

        }
    }
}

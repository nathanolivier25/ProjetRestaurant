using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Interface;
using BDD;

namespace Model
{
    public class Preparation : IPreparation

    {
        private String name;
        private BDDConnection bddconnection;
        private TransferableItemDecorator decorator;

        public Preparation(int id,BDDConnection _bddconnection)
        {
            bddconnection = _bddconnection;
            List<List<string>> table = bddconnection.executeQuery("SELECT * FROM Preparation WHERE IDPreparation = " + id);
            name = table.ElementAt(0).ElementAt(1);
            decorator = new TransferableItemDecorator(id, TransferableItemDecorator.Type.Preparation);
        }

        public override string toString()
        {
            return decorator.toString();
        }


    }
}

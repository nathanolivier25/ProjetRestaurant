using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BDD;

namespace Model
{
    public class Preparation : TransferableItemDecorator
    {
        private String name;
        private BDDConnection bddconnection;


        public Preparation(int id,BDDConnection _bddconnection): base(id, TransferableItemDecorator.Type.Preparation)
        {
            bddconnection = _bddconnection;
            List<List<string>> table = bddconnection.executeQuery("SELECT * FROM Preparation WHERE IDPreparation = " + id);
            name = table.ElementAt(0).ElementAt(1);
        }


    }
}

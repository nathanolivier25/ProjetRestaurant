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
        public string name;

        public Tool(int id,BDD.BDDConnection bdd) : base(id, TransferableItemDecorator.Type.Tool)
        {
            List<List<String>> table = bdd.executeQuery("SELECT * FROM Materiel WHERE IDMateriel = " + id);
            name = table.ElementAt(0).ElementAt(1);
        }


    }
}

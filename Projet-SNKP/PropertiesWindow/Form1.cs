using BDD;
using Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PropertiesWindow
{
    public partial class L_vitesse : Form
    {
        public L_vitesse()
        {
            InitializeComponent();
        }

        private void B_nouveau_groupe_Click(object sender, EventArgs e)
        {
            if(this.TB_nb_clients.Text != "")
            {
                string query = "INSERT INTO groupclient(NombreClient) VALUES(" +
                    this.TB_nb_clients.Text + ");";

                BDDConnection bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
                bdd_connection.executeNonQuery(query);
                bdd_connection.close();
            }
        }

        private void B_supprimer_Click(object sender, EventArgs e)
        {
            BDDConnection bdd_connection = new BDDConnection("SÉBASTIEN", "ProgSystem");
            bdd_connection.executeNonQuery("DELETE FROM groupclient;");
            bdd_connection.executeNonQuery("UPDATE tablerestaurant SET EtatTable = 0;");
            bdd_connection.executeNonQuery("UPDATE tablerestaurant SET IDGroup = NULL;");
            bdd_connection.close();
        }

        private void LB_vitesse_SelectedIndexChanged(object sender, EventArgs e)
        {
            Butler.Timer.Mode = int.Parse(this.LB_vitesse.Text);
        }
    }
}

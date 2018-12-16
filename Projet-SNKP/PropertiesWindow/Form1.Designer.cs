using Model;

namespace PropertiesWindow
{
    partial class L_vitesse
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.GB_nouveau_groupe = new System.Windows.Forms.GroupBox();
            this.L_nb_clients = new System.Windows.Forms.Label();
            this.TB_nb_clients = new System.Windows.Forms.TextBox();
            this.B_nouveau_groupe = new System.Windows.Forms.Button();
            this.B_supprimer = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.GB_vitesse = new System.Windows.Forms.GroupBox();
            this.LB_vitesse = new System.Windows.Forms.ListBox();
            this.GB_nouveau_groupe.SuspendLayout();
            this.GB_vitesse.SuspendLayout();
            this.SuspendLayout();
            // 
            // GB_nouveau_groupe
            // 
            this.GB_nouveau_groupe.Controls.Add(this.B_supprimer);
            this.GB_nouveau_groupe.Controls.Add(this.B_nouveau_groupe);
            this.GB_nouveau_groupe.Controls.Add(this.TB_nb_clients);
            this.GB_nouveau_groupe.Controls.Add(this.L_nb_clients);
            this.GB_nouveau_groupe.Location = new System.Drawing.Point(12, 12);
            this.GB_nouveau_groupe.Name = "GB_nouveau_groupe";
            this.GB_nouveau_groupe.Size = new System.Drawing.Size(215, 101);
            this.GB_nouveau_groupe.TabIndex = 0;
            this.GB_nouveau_groupe.TabStop = false;
            this.GB_nouveau_groupe.Text = "Nouveau groupe de client";
            // 
            // L_nb_clients
            // 
            this.L_nb_clients.AutoSize = true;
            this.L_nb_clients.Location = new System.Drawing.Point(6, 22);
            this.L_nb_clients.Name = "L_nb_clients";
            this.L_nb_clients.Size = new System.Drawing.Size(101, 13);
            this.L_nb_clients.TabIndex = 0;
            this.L_nb_clients.Text = "Nombre de clients : ";
            // 
            // TB_nb_clients
            // 
            this.TB_nb_clients.Location = new System.Drawing.Point(110, 19);
            this.TB_nb_clients.Name = "TB_nb_clients";
            this.TB_nb_clients.Size = new System.Drawing.Size(100, 20);
            this.TB_nb_clients.TabIndex = 1;
            this.TB_nb_clients.Text = "2";
            this.TB_nb_clients.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // B_nouveau_groupe
            // 
            this.B_nouveau_groupe.Location = new System.Drawing.Point(124, 61);
            this.B_nouveau_groupe.Name = "B_nouveau_groupe";
            this.B_nouveau_groupe.Size = new System.Drawing.Size(75, 23);
            this.B_nouveau_groupe.TabIndex = 2;
            this.B_nouveau_groupe.Text = "Ajouter";
            this.B_nouveau_groupe.UseVisualStyleBackColor = true;
            this.B_nouveau_groupe.Click += new System.EventHandler(this.B_nouveau_groupe_Click);
            // 
            // B_supprimer
            // 
            this.B_supprimer.Location = new System.Drawing.Point(9, 61);
            this.B_supprimer.Name = "B_supprimer";
            this.B_supprimer.Size = new System.Drawing.Size(75, 23);
            this.B_supprimer.TabIndex = 3;
            this.B_supprimer.Text = "Supprimer";
            this.B_supprimer.UseVisualStyleBackColor = true;
            this.B_supprimer.Click += new System.EventHandler(this.B_supprimer_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(50, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Vitesse : ";
            // 
            // GB_vitesse
            // 
            this.GB_vitesse.Controls.Add(this.LB_vitesse);
            this.GB_vitesse.Controls.Add(this.label1);
            this.GB_vitesse.Location = new System.Drawing.Point(12, 119);
            this.GB_vitesse.Name = "GB_vitesse";
            this.GB_vitesse.Size = new System.Drawing.Size(215, 60);
            this.GB_vitesse.TabIndex = 3;
            this.GB_vitesse.TabStop = false;
            this.GB_vitesse.Text = "Réglage de la vitesse";
            // 
            // LB_vitesse
            // 
            this.LB_vitesse.FormattingEnabled = true;
            this.LB_vitesse.Items.AddRange(new object[] {
            "1",
            "2",
            "3"});
            this.LB_vitesse.Location = new System.Drawing.Point(90, 21);
            this.LB_vitesse.Name = "LB_vitesse";
            this.LB_vitesse.Size = new System.Drawing.Size(120, 17);
            this.LB_vitesse.TabIndex = 2;
            this.LB_vitesse.SelectedIndexChanged += new System.EventHandler(this.LB_vitesse_SelectedIndexChanged);
            this.LB_vitesse.SelectedIndex = Butler.Timer.Mode - 1;
            // 
            // L_vitesse
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(239, 190);
            this.Controls.Add(this.GB_vitesse);
            this.Controls.Add(this.GB_nouveau_groupe);
            this.Name = "L_vitesse";
            this.Text = "Propriétés";
            this.GB_nouveau_groupe.ResumeLayout(false);
            this.GB_nouveau_groupe.PerformLayout();
            this.GB_vitesse.ResumeLayout(false);
            this.GB_vitesse.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox GB_nouveau_groupe;
        private System.Windows.Forms.Button B_nouveau_groupe;
        private System.Windows.Forms.TextBox TB_nb_clients;
        private System.Windows.Forms.Label L_nb_clients;
        private System.Windows.Forms.Button B_supprimer;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox GB_vitesse;
        private System.Windows.Forms.ListBox LB_vitesse;
    }
}


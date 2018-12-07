using System;
using System.Collections.Generic;

using SFML;
using SFML.Graphics;
using SFML.Window;
using SFML.System;

namespace GUI
{
    class Ressources
    {
        private static Ressources instance;
        private static Dictionary<string, Texture> ressourceArray;
        private static Dictionary<string, Font> fontArray;

        private Ressources()
        {
            ressourceArray = new Dictionary<string, Texture>();
            fontArray = new Dictionary<string, Font>();

            AddTexture("ressources/actionbar.png");
            AddTexture("ressources/actionbarplay.png");
            AddTexture("ressources/actionbarsuperplay.png");


            AddTexture("ressources/salle/background.png");
            AddTexture("ressources/salle/chef_de_rang.png");
            AddTexture("ressources/salle/client.png");
            AddTexture("ressources/salle/maitre_hotel.png");
            AddTexture("ressources/salle/serveur.png");
            AddTexture("ressources/salle/soumis.png");

            AddTexture("ressources/salle/table/1personne.png");
            AddTexture("ressources/salle/table/2personne.png");
            AddTexture("ressources/salle/table/3personne.png");
            AddTexture("ressources/salle/table/4personne.png");
            AddTexture("ressources/salle/table/5personne.png");
            AddTexture("ressources/salle/table/6personne.png");
            AddTexture("ressources/salle/table/7personne.png");
            AddTexture("ressources/salle/table/8personne.png");
            AddTexture("ressources/salle/table/9personne.png");
            AddTexture("ressources/salle/table/10personne.png");

            AddTexture("ressources/salle/table/debarasser.png");
            AddTexture("ressources/salle/table/installer.png");
            AddTexture("ressources/salle/table/manger.png");
            AddTexture("ressources/salle/table/vide.png");



            AddTexture("ressources/cuisine/background.png");


            AddFont("ressources/malgunbd.ttf");

        }

        public static Ressources Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new Ressources();
                }
                return instance;
            }
        }

        public Texture getTexture(string key)
        {
            try
            {
                return ressourceArray[key];
            }
            catch (KeyNotFoundException)
            {
                return null;
            }
        }

        private void AddTexture(string path)
        {
            Texture temp = new Texture(path);
            temp.Repeated = true;
            ressourceArray.Add(path,temp);
        }


        public Font getFont(string key)
        {
            try
            {
                return fontArray[key];
            }
            catch (KeyNotFoundException)
            {
                return null;
            }
        }

        private void AddFont(string path)
        {
            Font temp = new Font(path);
            fontArray.Add(path, temp);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SFML;
using SFML.Graphics;
using SFML.Window;
using SFML.System;

using Model;
using CuisineController;

namespace GUI
{
    class KitchenGUI : Drawable
    {
        Chef chef;
        Cooker cooker1;
        Cooker cooker2;
        Vector2f cooker1pos;
        Vector2f cooker2pos;
        string cooker1text;
        string cooker2text;

        public KitchenGUI(List<People> actorList)
        {
            chef = (Chef) actorList.ElementAt(0);
            cooker1 = (Cooker)actorList.ElementAt(1);
            cooker2 = (Cooker)actorList.ElementAt(2);
            cooker1pos = new Vector2f(360, 680);
            cooker2pos = new Vector2f(440, 680);
        }

        public void Draw(RenderTarget target, RenderStates states)
        {
            Sprite background = new Sprite(Ressources.Instance.getTexture("ressources/cuisine/background.png"));
            Sprite chefSprite = new Sprite(Ressources.Instance.getTexture("ressources/cuisine/chef.png"));
            Sprite cooker1Sprite = new Sprite(Ressources.Instance.getTexture("ressources/cuisine/cuisinier.png"));
            Sprite cooker2Sprite = new Sprite(Ressources.Instance.getTexture("ressources/cuisine/cuisinier.png"));

            chefSprite.Position = new Vector2f(60, 550);

            if(((StrategyCooker)cooker1.strategy).taskstate != -1)
            {
                if(((StrategyCooker)cooker1.strategy).cooking)
                    cooker1pos = new Vector2f(1020, 300);
                else
                    cooker1pos = new Vector2f(425, 300);
            }
            else
                cooker1pos = new Vector2f(360, 680);

            if (((StrategyCooker)cooker2.strategy).taskstate != -1)
            {
                if (((StrategyCooker)cooker2.strategy).cooking)
                    cooker2pos = new Vector2f(1020, 565);
                else
                    cooker2pos = new Vector2f(550, 500);
            }
            else
                cooker2pos = new Vector2f(540, 680);

            cooker1Sprite.Position = cooker1pos;
            cooker2Sprite.Position = cooker2pos;


            RectangleShape chefInfoTab = new RectangleShape(new Vector2f(150, 250));
            chefInfoTab.FillColor = new Color(0, 0, 0, 200);
            chefInfoTab.Position = new Vector2f(30, 300);

            RectangleShape cooker1InfoTab = new RectangleShape(new Vector2f(140, 80));
            cooker1InfoTab.FillColor = new Color(0, 0, 0, 200);
            cooker1InfoTab.Position = new Vector2f(cooker1pos.X - 20, cooker1pos.Y-70);

            RectangleShape cooker2InfoTab = new RectangleShape(new Vector2f(140, 80));
            cooker2InfoTab.FillColor = new Color(0, 0, 0, 200);
            cooker2InfoTab.Position = new Vector2f(cooker2pos.X - 20, cooker2pos.Y - 70);

            string tempchefinfostring = "";
            for(int i=0; i < ((StrategyChef)chef.strategy).myOrderList.Count && i < 10; i++)
                if (((StrategyChef)chef.strategy).myOrderList.ElementAt(i) != null)
                tempchefinfostring += " - " + ((StrategyChef)chef.strategy).myOrderList.ElementAt(i).name + "\n";

            if (((StrategyChef)chef.strategy).myOrderList.Count > 10)
                tempchefinfostring += " ... ";

            string tempcooker1infostring = "";
            if(((StrategyCooker)cooker1.strategy).taskstate != -1)
                tempcooker1infostring += ((StrategyCooker)cooker1.strategy).printstr + "temps restant : " + Interface.Timer.intTimeToStringTime(((StrategyCooker)cooker1.strategy).taskendtime - Interface.Timer.getInstance().getLocalTime());


            string tempcooker2infostring = "";
            if (((StrategyCooker)cooker2.strategy).taskstate != -1)
                tempcooker2infostring += ((StrategyCooker)cooker2.strategy).printstr + "temps restant : " + Interface.Timer.intTimeToStringTime(((StrategyCooker)cooker2.strategy).taskendtime - Interface.Timer.getInstance().getLocalTime());





            Text chefInfoText = new Text(tempchefinfostring, Ressources.Instance.getFont("ressources/malgunbd.ttf"));
            chefInfoText.Position = new Vector2f(40, 310);
            chefInfoText.Color = Color.White;
            chefInfoText.CharacterSize = 14;

            Text cooker1InfoText = new Text(tempcooker1infostring, Ressources.Instance.getFont("ressources/malgunbd.ttf"));
            cooker1InfoText.Color = Color.White;
            cooker1InfoText.CharacterSize = 10;
            cooker1InfoText.Position = new Vector2f(cooker1pos.X+5-20, cooker1pos.Y+5-70);

            Text cooker2InfoText = new Text(tempcooker2infostring, Ressources.Instance.getFont("ressources/malgunbd.ttf"));
            cooker2InfoText.Color = Color.White;
            cooker2InfoText.CharacterSize = 10;
            cooker2InfoText.Position = new Vector2f(cooker2pos.X+5-20, cooker2pos.Y+5-70);


            target.Draw(background);
            target.Draw(chefSprite);
            target.Draw(cooker1Sprite);
            target.Draw(cooker2Sprite);
            target.Draw(chefInfoTab);
            target.Draw(chefInfoText);
            target.Draw(cooker1InfoTab);
            target.Draw(cooker1InfoText);
            target.Draw(cooker2InfoTab);
            target.Draw(cooker2InfoText);
        }
    }
}

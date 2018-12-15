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


namespace GUI
{

    public class SnkpGUI
    {

        private Boolean restaurant;
        private RenderWindow app;
        private Boolean isOpen;
        private int timeState;
        private List<People> actorList;


        public SnkpGUI(Boolean restoRef, List<People> actorList)
        {
            this.restaurant = restoRef;
            this.app = new RenderWindow(new VideoMode(1200, 800), "SNKP!",Styles.Titlebar | Styles.Close);
            this.isOpen = new Boolean();
            this.timeState = 0;
            this.actorList = actorList;
        }

        public void run()
        {
            this.isOpen = true;
            this.app.Closed += new EventHandler(ClosedEvent);
            this.app.MouseButtonPressed += new EventHandler<MouseButtonEventArgs>(MouseButtonPressedEvent);
            this.app.MouseMoved += new EventHandler<MouseMoveEventArgs>(MouseMovedEvent);
            

            while (this.isOpen)
            {
                this.app.DispatchEvents();
                this.app.Clear();
                this.draw();
                this.app.Display();
            }
            this.app.Close();
        }

        private void ClosedEvent(object sender, EventArgs e)
        {
            this.isOpen = false;
        }

        private void MouseMovedEvent(object sender, MouseMoveEventArgs e)
        {

        }

        private void MouseButtonPressedEvent(object sender, MouseButtonEventArgs e)
        {
            if(e.Button == Mouse.Button.Left)
            {
                if (e.X >= 116 && e.X <= 144 && e.Y >= 15 && e.Y <= 43)
                {
                    this.timeState = 0;
                    Interface.Timer.getInstance().setMode(0);
                }
                else if (e.X >= 166 && e.X <= 194 && e.Y >= 15 && e.Y <= 43)
                {
                    this.timeState = 1;
                    Interface.Timer.getInstance().setMode(1);
                }
                else if (e.X >= 217 && e.X <= 245 && e.Y >= 15 && e.Y <= 43)
                {
                    this.timeState = 2;
                    Interface.Timer.getInstance().setMode(2);
                }
            }
        }

        private void draw()
        {
            Ressources ressources = Ressources.Instance;

            Sprite actionbar;
            switch (this.timeState)
            {
                case 0:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbar.png"));
                    break;
                case 1:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbarplay.png"));
                    break;
                default:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbarsuperplay.png"));
                    break;
            }
            actionbar.Position = new Vector2f(103, 5);
            Sprite background = new Sprite(ressources.getTexture("ressources/cuisine/background.png"));

            Text timeDisplay = new Text(Interface.Timer.intTimeToStringTime((int)Interface.Timer.getInstance().getLocalTime()), ressources.getFont("ressources/malgunbd.ttf"));
            timeDisplay.Color = Color.Black;
            timeDisplay.CharacterSize = 15;
            timeDisplay.Position = new Vector2f(274, 20);






            this.app.Draw(background);
            this.app.Draw(actionbar);
            this.app.Draw(timeDisplay);
            

        }

    }
}

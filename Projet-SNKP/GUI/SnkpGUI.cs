using System;

using SFML;
using SFML.Graphics;
using SFML.Window;
using SFML.System;


namespace GUI
{

    class SnkpGUI
    {

        private int restaurant;
        private RenderWindow app;
        private Boolean isOpen;
        private int timeState;
        private TimeSpan timeText;
        private Clock elapsedTime;


        public SnkpGUI(int restoRef)
        {
            this.restaurant = restoRef;
            this.app = new RenderWindow(new VideoMode(1200, 800), "SNKP!",Styles.Titlebar | Styles.Close);
            this.isOpen = new Boolean();
            this.timeState = 1;
            this.timeText = new TimeSpan(23,30,0);
            this.elapsedTime = new Clock();
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
                this.HandleEvent();
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
                    this.timeState = 1;
                }
                else if (e.X >= 166 && e.X <= 194 && e.Y >= 15 && e.Y <= 43)
                {
                    this.timeState = 2;
                }
                else if (e.X >= 217 && e.X <= 245 && e.Y >= 15 && e.Y <= 43)
                {
                    this.timeState = 3;
                }
            }
        }

        private void draw()
        {
            Ressources ressources = Ressources.Instance;

            Sprite actionbar;
            switch (this.timeState)
            {
                case 1:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbar.png"));
                    break;
                case 2:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbarplay.png"));
                    break;
                default:
                    actionbar = new Sprite(ressources.getTexture("ressources/actionbarsuperplay.png"));
                    break;
            }
            actionbar.Position = new Vector2f(103, 5);
            Sprite background = new Sprite(ressources.getTexture("ressources/cuisine/background.png"));

            Text timeDisplay = new Text(timeText.ToString(), ressources.getFont("ressources/malgunbd.ttf"));
            timeDisplay.Color = Color.Black;
            timeDisplay.CharacterSize = 15;
            timeDisplay.Position = new Vector2f(274, 20);






            this.app.Draw(background);
            this.app.Draw(actionbar);
            this.app.Draw(timeDisplay);
            

        }

        private void HandleEvent()
        {
            if(this.elapsedTime.ElapsedTime.AsSeconds() > 1 && timeState == 2)
            {
                this.elapsedTime.Restart();
                this.timeText = new TimeSpan(this.timeText.Hours, this.timeText.Minutes, this.timeText.Seconds + 1);
            }

            if (this.elapsedTime.ElapsedTime.AsMilliseconds() > 17 && timeState == 3)
            {
                this.elapsedTime.Restart();

                this.timeText = new TimeSpan(this.timeText.Hours, this.timeText.Minutes, this.timeText.Seconds + 1);

            }

        }



    }
}

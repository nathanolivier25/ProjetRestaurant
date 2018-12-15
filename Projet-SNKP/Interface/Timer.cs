using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using SFML;
using SFML.Graphics;
using SFML.Window;
using SFML.System;

namespace Interface
{
    public class Timer
    {
        private static Timer instance = null;
        private static Clock clock = null;
        private static Thread thread = null;
        private static int actualTime = 0;
        private static int mode = 0;
        private static Boolean isopen = true;

        private Timer()
        {
            clock = new Clock();
            thread = new Thread(new ThreadStart(ThreadMain));
            thread.Start();
            actualTime = 0;
            mode = 0;
            isopen = true;
        }

        private void ThreadMain()
        {
            while (isopen)
            {


                if (clock.ElapsedTime.AsMilliseconds() >= 1000 && mode == 1)
                {
                    clock.Restart();
                    actualTime++;
                }
                else if (clock.ElapsedTime.AsMilliseconds() >= 200 && mode == 2)
                {
                    clock.Restart();
                    actualTime++;
                }

                Thread.Sleep(50);
            }
        }

        public static Timer getInstance()
        {
            if(instance == null)
            {
                instance = new Timer();
            }

            return instance;
        }

        public int getLocalTime()
        {
            return actualTime;
        }

        public void setMode(int _mode)
        {
            mode = _mode;
        }

        public void close()
        {
            isopen = false;
        }

        public static String intTimeToStringTime(int i)
        {
            String str = "";
            int hour = ((int)Math.Truncate((double)(i / 3600))) % 24;
            int minute = ((int)Math.Truncate((double)(i / 60))) % 60;
            int seconds = i % 60;

            if (hour >= 10)
                str += hour;
            else
                str += "0" + hour;

            str += ":";

            if (minute >= 10)
                str += minute;
            else
                str += "0" + minute;

            str += ":";

            if (seconds >= 10)
                str += seconds;
            else
                str += "0" + seconds;

            return str;

        }

    }
}

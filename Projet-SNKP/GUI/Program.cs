﻿using System;
using GUI;

using SFML;
using SFML.Graphics;
using SFML.Window;
using SFML.System;

namespace SFML_Test
{
    static class Program
    {

        static void Main()
        {
            GUI.SnkpGUI window = new GUI.SnkpGUI(1);

            window.run();
           
        } 
    } 
}
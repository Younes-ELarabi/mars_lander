with flag; use flag;
with Ada.Real_Time; use Ada.Real_Time;
with Display.Basic; use Display.Basic;
With Mars_Lander;   use Mars_Lander;
with PIDController; use PIDController;
with terrain_package;       use terrain_package;
with path;          use path;
with Ada.Text_IO;   use Ada.Text_IO;

package controller is

   task AI_Task;

end controller;

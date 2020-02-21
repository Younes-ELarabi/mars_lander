with Mars_Lander; use Mars_Lander;
with PIDController;  use PIDController;
with Ada.Text_IO; use Ada.Text_IO;

package simulation is

   task update; -- calls Lander.Step procedure
   
end simulation;

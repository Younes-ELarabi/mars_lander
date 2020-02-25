with flag; use flag;
with Ada.Real_Time; use Ada.Real_Time;
with Display.Basic; use Display.Basic;
With Mars_Lander;   use Mars_Lander;
with PIDController;  use PIDController;
with Ada.Text_IO; use Ada.Text_IO;

package body inputs is

   task body update is
      Next : Time;
      -- declare a constant Period of 40 milliseconds of type Time_Span defining
      -- the loop period
      Period : constant Time_Span := Milliseconds (10);
   begin 
      Next := Clock + Period;
      while StepFlag.getFlag loop 
         Mars_Lander.inputFlags.setUp(Get_Key_Status(SDLK_UP));
         Mars_Lander.inputFlags.setLeft(Get_Key_Status(SDLK_LEFT));
         Mars_Lander.inputFlags.setRight(Get_Key_Status(SDLK_RIGHT));
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;
   end update;

end inputs;

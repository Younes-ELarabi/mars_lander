with Mars_Lander; use Mars_Lander;
with flag; use flag;
with Ada.Real_Time; use Ada.Real_Time;

package body simulation is
   
   task body update is
      Next : Time;
      --  declare a constant Period of 40 milliseconds of type Time_Span defining
      --  the loop period
      Period : constant Time_Span := Milliseconds (10);
      error :Float := 2.0;
      --for test
   begin
      pid_controller.init(20.0,1.01,0.3,0.0);
      Next := Clock + Period;
      while StepFlag.getFlag loop
         Mars_Lander.Lander.step;
         -- test pid
         Put_Line(Float'Image(error));
         pid_controller.update(error);
         --
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;
   end update;
   
end simulation;

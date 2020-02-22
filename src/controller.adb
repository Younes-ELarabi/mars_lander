package body controller is

   task body AI_Task is
      Next : Time;
      -- declare a constant Period of 40 milliseconds of type Time_Span defining
      -- the loop period
      Period : constant Time_Span := Milliseconds (10);
      --
      currentPositionY :Float;
      output :Float;
   begin 
      Next := Clock + Period;
      pid_controller.init(100.0,0.1,0.0,0.0);
      while StepFlag.getFlag loop 
         --
         currentPositionY := Mars_Lander.Lander.getPosition.y;
         output := currentPositionY;
         --
         Put_Line(Float'Image(output));
         pid_controller.update(output);
         if output > 0.0 then
            Mars_Lander.inputFlags.setUp(true);
         elsif output < 0.0 then
            Mars_Lander.inputFlags.setUp(false);
         elsif output = 0.0 then
            Mars_Lander.inputFlags.setUp(true);        
         end if;
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;
   
   
   end AI_Task;
   
end controller;

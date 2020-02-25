package body controller is

   task body AI_Task is
      Next : Time;
      -- declare a constant Period of 40 milliseconds of type Time_Span defining
      -- the loop period
      Period : constant Time_Span := Milliseconds (10);
      --
      inputY :Float;
      YController :pid_controller;
      setPoint :Float := 40.0;
      --
      traj :trajectory_object;      
   begin 
      Next := Clock + Period;
      traj.generateTrajectory;
      YController.init(setPoint,0.7,0.0001,100.0);
      while StepFlag.getFlag loop 
         -- Convergence to Y setPoint
         inputY := Lander.getPosition.y;      
         YController.update(inputY);
         if inputY > 0.0 then
            Mars_Lander.inputFlags.setUp(true);
         elsif inputY < 0.0 then
            Mars_Lander.inputFlags.setUp(false);    
         end if;
         if setPoint - Lander.getPosition.y < 1.0 then
            Put_Line("On target");
            Put_Line(Float'Image(Lander.getPosition.y));
            -- For test
            setPoint := 300.00;
            YController.reset(setPoint);
            --
         else
            Put_Line(Float'Image(Lander.getPosition.y));
            Put_Line("Moving to target");
         end if;
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;  
   end AI_Task;   
end controller;

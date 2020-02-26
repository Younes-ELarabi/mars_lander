package body controller is

   task body AI_Task is
      Next : Time;
      -- declare a constant Period of 40 milliseconds of type Time_Span defining
      -- the loop period
      Period : constant Time_Span := Milliseconds (10);
      --
      inputY :Float;
      YController :pid_controller;
      --
      inputX :Float;
      XController :pid_controller;
      --
      t :Path_Type;
      indexX :Integer := 1;
      indexY :Integer := 1;
   begin 
      Next := Clock + Period;
      -- Trajectory 
      trajectory_object.generate;
      trajectory_object.get_trajectory(t);
      -- PID setup
      YController.init(t(indexX).Y,0.7,0.0001,100.0);
      XController.init(t(indexX).X,10.0,0.0,3000.0);
      -- main loop 
      while StepFlag.getFlag loop 
         -- Convergence to Y setPoint
         inputY := Lander.getPosition.y;      
         YController.update(inputY);
         if inputY > 0.0 then
            Mars_Lander.inputFlags.setUp(true);
         elsif inputY < 0.0 then
            Mars_Lander.inputFlags.setUp(false);    
         end if;
         if  abs(t(indexY).Y - Lander.getPosition.y) < 1.0  then
            --Put_Line("<-----------On target Y------------>");
            indexY := indexY + 1;
            if indexY <= lengthOfTrajectory then              
               YController.reset(t(indexY).Y);
            else
               indexY := lengthOfTrajectory;
            end if;
         else
            --Put_Line("Moving to target Y " & Float'Image(t(indexX).Y));
            Put_Line("");
         end if;
         -- Convergence to X setPoint
         inputX := Lander.getPosition.x;      
         XController.update(inputX);
         if inputX > 2.5 then
            Mars_Lander.inputFlags.setLeft(false);
            Mars_Lander.inputFlags.setRight(true);
         elsif inputX < -2.5 then
            Mars_Lander.inputFlags.setLeft(true);
            Mars_Lander.inputFlags.setRight(false);
         else         
            if Lander.getDirection > 0.0 then
               while not (Lander.getDirection = 0.0) loop
                  Mars_Lander.inputFlags.setLeft(true);
               end loop;
               Mars_Lander.inputFlags.setLeft(false);
            elsif Lander.getDirection < 0.0 then
               while not (Lander.getDirection = 0.0) loop
                  Mars_Lander.inputFlags.setRight(true);
               end loop;
               Mars_Lander.inputFlags.setRight(false);
            else
               Mars_Lander.inputFlags.setLeft(false);
               Mars_Lander.inputFlags.setRight(false);
            end if;
            indexX := indexX + 1;
            if indexX <= lengthOfTrajectory then              
               XController.reset(t(indexX).X);
               Put_Line("Moving to target X " & Float'Image(t(indexX).Y));
            else
               indexX := lengthOfTrajectory;
            end if;
         end if;       
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;  
   end AI_Task;   
end controller;

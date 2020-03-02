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
      t :curveType;
      s :Terrain_Type;
      --
      index :Integer := 1;
   begin
      Next := Clock + Period;
      -- Trajectory 
      Terrain_Object.get_terrain(s); -- surface
      trajectory_object.setTerrain(s);
      trajectory_object.init;
      trajectory_object.compute;
      trajectory_object.get_curvePoints(t);
      -- PID setup
      YController.init(t(index).Y,0.7,0.0001,100.0);
      XController.init(t(index).X,0.001,0.0,100.0);
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
         -- Convergence to X setPoint
         inputX := Lander.getPosition.x;      
         XController.update(inputX);
         if inputX > 0.0 then  
            Mars_Lander.inputFlags.setLeft(false);
            Mars_Lander.inputFlags.setRight(true);  
         elsif inputX < 0.0 then 
            Mars_Lander.inputFlags.setLeft(true);
            Mars_Lander.inputFlags.setRight(false);        
         else 
            Mars_Lander.inputFlags.setLeft(false);
            Mars_Lander.inputFlags.setRight(false);
         end if;
         -- Move to next target (x,y) if convergence at X and Y
         if  abs(t(index).Y - Lander.getPosition.y) < 1.0 and
         abs(Lander.getPosition.x - t(index).X) < 3.0 then
            if index + 1 <= lengthOfTrajectory then
               index := index + 1;
               YController.reset(t(index).Y);
               XController.reset(t(index).X);
            else
               index := lengthOfTrajectory;
            end if;
         end if;
         -- wait until Next
         delay until Next;
         Next := Next + Period;
      end loop;  
   end AI_Task;   
end controller;

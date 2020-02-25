package body path is

   protected body trajectory_object is
      
      function getNextTarget return cordinates is 
      begin
         return trajectory_object.trajectory(cpt);      
      end getNextTarget;
   
      function hasNext return boolean is  
      begin
         return cpt < lengthOfTrajectory;
      end hasNext;
      
      procedure generateTrajectory is 
      begin
         for I in 1..lengthOfTrajectory loop
            trajectory(I) := (0.0,250.0);
         end loop;
      end;
      
   end trajectory_object;
     
end path;

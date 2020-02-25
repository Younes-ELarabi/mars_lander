with terrain; use terrain;

package path is
   
   lengthOfTrajectory :constant := 20;
      
   type Path_Type is array(1..lengthOfTrajectory) of cordinates;

   protected type trajectory_object is 
      
      function getNextTarget return cordinates;
      
      function hasNext return boolean;
      
      procedure generateTrajectory;
      
   private
      
      trajectory :Path_Type;
      cpt :Integer := 0;   
                  
   end trajectory_object;

end path;

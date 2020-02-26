with terrain; use terrain;
with Ada.Text_IO;   use Ada.Text_IO;

package path is
   
   lengthOfTrajectory :constant := 20;
      
   type Path_Type is array(1..lengthOfTrajectory) of cordinates;

   protected trajectory_object is  
      
      procedure generate;
      
      entry get_trajectory(value : out Path_Type);
      
   private
      
      trajectory :Path_Type;
      is_generated :Boolean := false;
                  
   end trajectory_object;

end path;

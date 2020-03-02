with terrain_package; use terrain_package;
with Ada.Text_IO;   use Ada.Text_IO;
with Display;       use Display;
with Display.Basic; use Display.Basic;
with Display.Image; use Display.Image;
with Mars_Lander;   use Mars_Lander;

package path is
   
   lengthOfTrajectory :constant := 25;
   
   type controlType is array(1..4) of cordinates;
   
   type curveType is array(1..lengthOfTrajectory) of cordinates;

   protected trajectory_object is  
      
      procedure compute;
      
      procedure subDivide(p1,p2 :in out cordinates; t :Float);
      
      entry get_curvePoints(value :out curveType);
      
      procedure drawTrajectory(Canvas : Canvas_ID);
      
      procedure setTerrain(t :Terrain_Type); 
      
      procedure init;
      
      procedure enableDrawing;
      
      procedure disableDrawing;
      
      function getDrawFlag return Boolean;
      
   private
      
      terrain :Terrain_Type;
      is_ready :Boolean := false;
      draw :Boolean := false;
      --
      controlPoints : controlType;
      curvePoints   :curveType;
      --
      p1,p2,p3,p4 :Point_3d;
      
                  
   end trajectory_object;

end path;

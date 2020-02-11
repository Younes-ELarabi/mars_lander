with Display;       use Display;
with Display.Basic; use Display.Basic;
with Display.Image; use Display.Image;
with Ada.Text_IO;   use Ada.Text_IO;
with vector;        use vector;
with flag;          use flag;
with Collision;     use Collision;
with terrain;       use terrain;

package Mars_Lander is
   
   width  : constant := 800;
   height : constant := 800;
   
   ship_width : constant := 25.0;
   ship_height :constant := 25.0;
   
   type angle_value is digits 10 range -45.0 .. 45.0;
   
   type mars_rectangle is record 
      A,B,C,D: Point_3d;
   end record;
   
   type collisionData is record
      p1,p2 : Point_3d;
   end record;
   
   protected Lander is 
      
      procedure Draw(Canvas :Canvas_ID;width, height: Float;
                     sky, shipImage:Image_T);
   
      procedure Step;
   
      function hasCollided return Boolean;
      
      function isLanded return Boolean;
   
      function getShipImage(image : Image_T;id :Integer) return Image_T;
   
      function getIdImage return Integer;
      
      procedure updateBounds(previousBounds : in out mars_rectangle);
           
   private
      
      procedure accelerate;
      
      procedure turnRight(direction : in out angle_value);
      
      procedure turnLeft(direction : in out angle_value);
      
      direction :angle_value;
      position, velocity: Vector_Type;
      thrust :Float := 0.0;
      
      rayon :Float := 50.0;
      tick_number : Integer := 0; 
      activeReactor : Boolean := false;
      
      bounds :mars_rectangle;
      
   end Lander;
   
   protected inputFlags is
      
      function getUp return Boolean;
      procedure setUp(other :Boolean);
      
      function getLeft return Boolean;
      procedure setLeft(other :Boolean);
      
      function getRight return Boolean;
      procedure setRight(other :Boolean);
      
   private
      up :Boolean := false;
      left  :Boolean := false;
      right :Boolean := false;
   end inputFlags;
      
end Mars_Lander;

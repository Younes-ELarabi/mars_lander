package body Mars_Lander is

   protected body Lander is
      procedure Draw (Canvas : Canvas_ID;width, height: Float;
                      sky, shipImage:Image_T) is
         spaceShip :Image_T := getShipImage(shipImage, getIdImage);
         
      begin
         Draw_Image(Canvas,
                    (
                     0.0, -- vector.x
                     0.0, -- vector.y
                     -1.0  -- vector.z
                    )
                    ,
                    width, -- width
                    height -- height
                    , -- direction goes here
                    sky);
         Draw_Image(Canvas,
                    (
                     position.x, -- vector.x
                     position.y, -- vector.y
                     0.0  -- vector.z
                    )
                    ,
                    ship_width, -- width
                    ship_height, -- height
                    Float (direction), -- direction goes here
                    spaceShip);
         -- target 
         Draw_Circle(Canvas,
                     (200.0,0.0,0.0),
                     2.0,
                     Green);
         -- start point
         Draw_Circle(Canvas,
                     (0.0,0.0,0.0),
                     2.0,
                     White);
      end Draw;
      
      procedure updateBounds(previousBounds : in out mars_rectangle) is
      begin
         previousBounds.A := (position.x - ship_width/2.0,position.y + ship_height/2.0,0.0);
         previousBounds.B := (position.x + ship_width/2.0,position.y + ship_height/2.0,0.0);
         previousBounds.C := (position.x + ship_width/2.0,position.y - ship_height/2.0,0.0);
         previousBounds.D := (position.x - ship_width/2.0,position.y - ship_height/2.0,0.0);
      end updateBounds;
          
      
      function getIdImage return Integer is
      begin
         if thrust = 0.0 then
            return 0;
         elsif not activeReactor then
            return 1;
         else
            return 2;
         end if;
      end getIdImage;

      function getShipImage(image : Image_T;id :Integer) return Image_T is
         sub_Image  :Image_T := new RGBA_Array(1..22,1..20);
      begin
         for I in 1..22 loop
            for J in 1..20 loop
               sub_Image(I,J) := image(I,J + 20*id);
            end loop;
         end loop;
         return sub_Image;
      end getShipImage;

      function hasCollided return Boolean is
         collision :Boolean := false;
         surface :Terrain_Type; 
      begin
         Terrain_Object.get_terrain(surface);         
         for I in 1..terrain.size-1 loop
            if Line_Rectangle(
                              bounds.A,bounds.B,
                              bounds.C,bounds.D,
                              ( (surface(I).X,surface(I).Y,0.0)),
                              (surface(I+1).X,surface(I+1).Y,0.0)) then               
               collision := true;
            end if;
         end loop;
         return collision;
      end hasCollided;
      
      function isLanded return Boolean is
         surface :Terrain_Type;
         pointA,pointB :Point_3d;
      begin         
         Terrain_Object.get_terrain(surface);  
         for I in 1..terrain.size-1 loop
            if Line_Rectangle(
                              bounds.A,bounds.B,
                              bounds.C,bounds.D,
                              ( (surface(I).X,surface(I).Y,0.0)),
                              (surface(I+1).X,surface(I+1).Y,0.0)) then                             
               pointA := (surface(I).X,surface(I).Y,0.0);
               pointB := (surface(I+1).X,surface(I+1).Y,0.0);
            end if;
         end loop;
         return ( hasCollided and (pointA.Y = pointB.Y) 
                  and (velocity.y*velocity.y + velocity.x*velocity.x) < 4.0)
           and (direction > -10.0 and direction < 10.0);                  
      end isLanded;
      
      procedure accelerate is
      begin
         tick_number := tick_number + 1;
         thrust := 0.02;
         if tick_number > 75 then
            activeReactor := true;
         else
            activeReactor := false;
         end if;
      end accelerate;
      
      procedure turnRight(direction : in out angle_value) is
         directionParam : constant := 0.35;
      begin
         if  direction - directionParam > angle_value'First then
            direction := direction - directionParam;
         end if;
      end turnRight;
      
      procedure turnLeft(direction : in out angle_value) is
         directionParam : constant := 0.35;
      begin
         if  direction + directionParam < angle_value'Last then
            direction := direction + directionParam;
         end if;
      end turnLeft;
      
      procedure Step is
         --gravity vector
         gravity : Vector_Type := (0.0, -0.01);        
      begin        
         -- UP 
         if inputFlags.getUp then 
            accelerate;
         else
            activeReactor := False;
            tick_number := 0;
            thrust:= 0.0;
         end if;
         -- RIGHT 
         if inputFlags.getRight then          
            turnRight(direction);
         end if;
         -- LEFT 
         if inputFlags.getLeft then         
            turnLeft(direction);
         end if;
         -- gravity + update velocity
         velocity := velocity + From_Angle(Float(direction)) *
           thrust + gravity;
         -- update postion
         position := position + velocity;
         -- update bounds
         updateBounds(bounds);
      end Step;
      
      function getPosition return Vector_Type is
      begin
         return position;
      end getPosition;
      
      function getDirection return angle_value is
      begin
         return direction;
      end getDirection;
      
   end Lander;
   
   protected body inputFlags is
      
      function getUp return Boolean is 
      begin
         return up;
      end getUp;
        
      procedure setUp(other :Boolean) is 
      begin
         up := other;
      end setUp;
      
      function getLeft return Boolean is 
      begin
         return left;
      end getLeft;
        
      procedure setLeft(other :Boolean) is 
      begin
         left := other;
      end setLeft;
      
      function getRight return Boolean is 
      begin
         return right;
      end getRight;
        
      procedure setRight(other :Boolean) is 
      begin
         right := other;
      end setRight;
      
   end inputFlags;
end Mars_Lander;

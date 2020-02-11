with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;

with Display;       use Display;
with Display.Basic; use Display.Basic;
with Display.Image; use Display.Image;
with vector;        use vector;
with Mars_Lander;   use Mars_Lander;
with simulation;
with inputs;
with flag; use flag;
with terrain; use terrain;

procedure Main is
   -- procedure to draw terrain
   procedure drawTerrain(Canvas : Canvas_ID;t :Terrain_Type) is
      pointA : Point_3d;
      pointB : Point_3d;
   begin
      for I in 1..size-1 loop
         pointA := (t(I).X,t(I).Y,0.0);
         pointB := (t(I+1).X,t(I+1).Y,0.0);
         Draw_Line(Canvas,
                   pointa,
                   pointb,
                   Green
                  );
      end loop;
   end drawTerrain;
   --  declare a variable Next of type Time to store the Next step time
   Next : Time;

   --  declare a constant Period of 40 milliseconds of type Time_Span defining
   --  the loop period
   Period : constant Time_Span := Milliseconds (10);

   --  reference to the application window
   Window : Window_ID;

   --  reference to the graphical canvas associated with the application window
   Canvas : Canvas_ID;

   Width : constant := 800.0;
   Height : constant := 800.0;
   -- data :Lander_Type;

   ship_width :Float := 25.0;
   ship_height :Float:= 25.0;

   --we use this screen_point to center the game over message
   gameOver :Screen_Point := (Integer(Width/2.0),Integer(Height/2.0));
   sky : Image_T := Load_BMP("../sky.bmp");
   spaceship : Image_T := Load_BMP("../mars_lander.bmp");

   t :Terrain_Type;
begin


   Window :=
     Create_Window (Integer (Width),Integer (Height), "Mars Lander");

   --  Retrieve the graphical canvas from the window
   Canvas := Get_Canvas (Window);

   --  initialize the Next step time begin the current time (Clock) + the period
   Next := Clock + Period;

   Terrain_Object.generate;
   Terrain_Object.get_terrain(t);

   while StepFlag.getFlag loop
      Swap_Buffers (Window);
      Mars_Lander.Lander.Draw(Canvas,ship_width,ship_height,sky,spaceship);
      drawTerrain(Canvas,t);
      -- wait until Next
      delay until Next;
      --  update the Next time adding the period for the next step
      Next := Next + Period;
      -- Put_Line(Boolean'Image(Lander.isLanded));
      StepFlag.setFlag(not Lander.hasCollided and not Lander.isLanded);
   end loop;

   Put_Line("   Land   status = " & Boolean'Image(Lander.isLanded));
   Put_Line("Collision status = " & Boolean'Image(Lander.hasCollided));

   --Game over loop. Need to press space to close the window
   while not Get_Key_Status(SDLK_SPACE) loop
      Swap_Buffers (Window);
      delay until Next;
      if Lander.isLanded then
         Draw_Text(Canvas, gameOver,"YOU WIN :)", Green);
      else
         Draw_Text(Canvas, gameOver,"GAME OVER", Red);
      end if;

      Next := Next + Period;
   end loop;

end Main;

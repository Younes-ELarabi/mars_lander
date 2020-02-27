with Display.Basic; use Display.Basic;
with Display;       use Display;
with Perlin;        use Perlin;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Discrete_Random;

package terrain_package is
   
   size :constant := 800;
   
   type cordinates is record
      X : Float;
      Y : Float;
   end record;
   
   type Terrain_Type is array(1..size) of cordinates;
   
   -- Given two ranges [a1,a2] and [b1,b2] and a value in range [a1,a2]
   -- value is linearly mapped to a value t in range [b1,b2]
   
   function map_value(value :Float;a1 :Float;a2 :Float;b1:Float;b2:Float) return Float;
   
   protected Terrain_Object is
      
      procedure generate;
      procedure generateHorizentalSurface(terrain : in out Terrain_Type;length :Integer);
      entry get_terrain(value : out Terrain_Type);
      function getLength return Float;
      
   private
      terrain :Terrain_Type;
      is_generated :Boolean := false;
      sizeOfSurface :Float; -- length of horizental surface
   end Terrain_Object;
   
private
   
   function partition(tab :  in out Terrain_Type;low :Integer;high :Integer) return Integer;
   procedure sort(tab :in out Terrain_Type;low :Integer;high :Integer);
   
end terrain_package;

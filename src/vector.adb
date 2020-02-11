with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
package body vector is

   function "+"(Left, Right : Vector_Type) return Vector_Type is
   begin
      return (Left.x + Right.x, Left.y + Right.y);
   end "+";

   function "*"(Left: Vector_Type; Right: Float) return Vector_Type is
   begin
      return (Left.x * Right, Left.y * Right);
   end "*";

   function From_Angle(Angle :Float)return Vector_Type is
   begin
      return (-Sin(Angle*3.1415/180.0),Cos(Angle*3.1415/180.0));
   end From_Angle;
end  vector;

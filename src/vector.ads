package vector is
   
   type Vector_Type is record 
      x, y : Float;
   end record;
   
   function "+"(Left, Right : Vector_Type) return Vector_Type;
   function "*"(Left : Vector_Type; Right : Float) return Vector_Type;
   function From_Angle(Angle : Float) return Vector_Type;
   
end vector;

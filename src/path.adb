package body path is

   protected body trajectory_object is
      
      procedure generate is 
      begin
         if not is_generated then
            for I in 1..lengthOfTrajectory loop
               trajectory(I) := (10.0*Float(I),400.0-20.0*Float(I));
               Put_Line("For I = " 
                        & Float'Image(Float(I)) 
                        & " : " & Float'Image(trajectory(I).X) 
                        & " " & Float'Image(trajectory(I).Y));
            end loop;
            -- set barrier to true
            is_generated := true;
         end if;    
      end generate;
      
      entry get_trajectory(value : out Path_Type)
        when is_generated is
         --  Entry is blocked until the condition is true.
         --  The barrier is evaluated at call of entries and at exits of        
      begin
         value := trajectory;
      end get_trajectory;
      
   end trajectory_object;
     
end path;

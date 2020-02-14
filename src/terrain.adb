package body terrain is

   protected body Terrain_Object is
      procedure generate is
         type custom is new Integer range 0 .. 3000;
         package rand_custom is new Ada.Numerics.Discrete_Random(custom);
         use rand_custom;
         Seed : Generator;
         randVal  : custom;
         -- like a time value, keep it low to get smooth surface
         k :Float := 0.1;         
      begin
         if not is_generated then
            rand_custom.Reset(Seed);
            randVal := Random(Seed);
            Perlin.Reset(Integer(randVal));
            for I in 1..size loop
               terrain(I) := (map_value(Float(I),1.0,Float(size),-400.0,400.0),
                              map_value(Noise(k),0.0,1.0,-400.0,0.0));
               k := k + 0.01;
            end loop;
            sort(terrain,1,size);
            -- create surface for Landing
            generateHorizentalSurface(terrain,40);
            -- set barrier to true
            is_generated := true;
         end if;         
      end generate;
      
      procedure generateHorizentalSurface(terrain : in out Terrain_Type;length :Integer) is
         type custom is new Integer range 0 .. size - length;
         package rand_custom is new Ada.Numerics.Discrete_Random(custom);
         use rand_custom;
         Seed : Generator;
         num  : custom;
         y :Float;
      begin
         -- Generate a random integer from 0 to size - length
         rand_custom.Reset(Seed);
         num := Random(Seed);
         y := terrain(Integer(num)).Y;
         for J in num .. num + custom(length) loop
            terrain(Integer(J)) := (terrain(Integer(J)).X,y);
         end loop;
         
      end generateHorizentalSurface;
      
      entry get_terrain(value : out Terrain_Type)
        when is_generated is
         --  Entry is blocked until the condition is true.
         --  The barrier is evaluated at call of entries and at exits of        
      begin
         value := terrain;
      end get_terrain;
      
   end Terrain_Object;
   
   function map_value(value :Float;a1 :Float;a2 :Float;b1:Float;b2:Float) return Float is 
   begin
      return b1 + (value - a1)*(b2 - b1)/(a2-a1);
   end map_value;
   
   function partition(tab : in out Terrain_Type;low :Integer;high :Integer) return Integer is
      pivot :cordinates := tab(high);
      i : Integer := low - 1;
      temp :cordinates;
   begin
      for J in low..high-1 loop
         if tab(J).X < pivot.X then
            i:= i + 1;
            temp := tab(I);
            tab(I) := tab(J);
            tab(J) := temp;
         end if;
      end loop;
      temp := tab(i+1);
      tab(i+1) := tab(high);
      tab(high) := temp;
      
      return i+1;      
   end partition;
   
   procedure sort(tab :in out Terrain_Type;low :Integer;high :Integer) is
      pi :Integer; 
   begin
      if(low < high) then
         pi := partition(tab,low,high);
         sort(tab,low,pi-1);
         sort(tab,pi+1,high);
      end if;
   end sort;
   
end terrain;

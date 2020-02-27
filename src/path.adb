package body path is

   protected body trajectory_object is
      
      entry get_curvePoints(value : out curveType)
        when is_ready is
         --  Entry is blocked until the condition is true.
         --  The barrier is evaluated at call of entries and at exits of        
      begin
         value := curvePoints;
      end get_curvePoints;
      
      procedure init is
         pA,pB :Point_3d;
      begin
         p1 := (0.0,0.0,0.0); -- initial position of the lander
         find_Horizental :
         for I in 1..terrain_package.size-1 loop
            pA := (terrain(I).X,terrain(I).Y,0.0);
            pB := (terrain(I+1).X,terrain(I+1).Y,0.0);
            exit find_Horizental when pA.Y = pB.Y;
         end loop find_Horizental;
         p2 := ((pB.x+pA.x)/2.0,0.0,0.0);
         p3 := (pA.x,-pA.y/2.0,0.0);
         p4 := ((pB.x+pA.x)/2.0,pA.y,0.0);
         --Put_Line(Float'Image(pA.x) & " : " & Float'Image(pA.y));
         controlPoints(1):=(p1.x,p1.y);
         controlPoints(2):=(p2.x,p2.y);
         controlPoints(3):=(p3.x,p3.y);
         controlPoints(4):=(p4.x,p4.y);
      end init;
      
      procedure compute is
         tmp :controlType;
         depth,t :Float;
      begin
         for I in 1..lengthOfTrajectory loop
            t:= Float(I)/Float(lengthOfTrajectory-1);
            for J in 1..4 loop
               tmp(J):=(controlPoints(j).X,controlPoints(j).Y);
            end loop;
            depth := 4.0;
            while depth > 1.0 loop
               for k in 1..Integer(depth) - 1 loop
                  subDivide(tmp(k),tmp(k+1),t);
               end loop;
               depth := depth - 1.0;
            end loop;
            curvePoints(I) := (tmp(1).x,tmp(1).y);
         end loop;
         is_ready := true;
      end compute;
      
      procedure subDivide(p1,p2 :in out cordinates; t :Float) is
      begin
         if(p1.x>p2.x) then
            p1.x:= p1.x - abs(p1.x-p2.x)*t;
         else
            p1.x:= p1.x + abs(p1.x-p2.x)*t;
         end if;
         if (p1.y>p2.y) then
            p1.y:= p1.y - abs(p1.y-p2.y)*t;
         else
            p1.y:= p1.y + abs(p1.y-p2.y)*t;
         end if;
      end subDivide;
      
      -- procedure to draw trajectory
      procedure drawTrajectory(Canvas : Canvas_ID) is
         pointA : Point_3d;
         pointB : Point_3d;
      begin
         for I in 1..lengthOfTrajectory-1 loop
            pointA := (curvePoints(I).X,curvePoints(I).Y,0.0);
            pointB := (curvePoints(I+1).X,curvePoints(I+1).Y,0.0);     
            Draw_Line(Canvas,
                      pointa,
                      pointb,
                      Yellow
                     );     
         end loop;
      end drawTrajectory;
      
      procedure setTerrain(t :Terrain_Type) is 
      begin
         terrain := t;
      end setTerrain;
      
      
   end trajectory_object;
     
end path;

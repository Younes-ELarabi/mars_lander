package body flag is

   protected body StepFlag is
      
      function getFlag return Boolean is 
      begin
         return flag;
      end getFlag;
      
      procedure setFlag(other :Boolean) is 
      begin
         flag := other;
      end setFlag;
   end StepFlag;
   
   

end flag;

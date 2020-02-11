package flag is

   protected StepFlag is
      
      function getFlag return Boolean;
      procedure setFlag(other :Boolean);
   private
      flag :Boolean := true;
   end StepFlag;
   
end flag;

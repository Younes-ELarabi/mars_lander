package body PIDController is

   protected body pid_controller is
      
      procedure init(target,kp,ki,kd :Float) is 
      begin
         --targetPoint := target;
         reset(target);
         pGain := kp;
         iGain := ki;
         dGain := kd;
      end init;
      
      procedure setIntegral(integral : in out Float;error :Float) is
      begin
         integral := integral + error;
      end setIntegral;
      
      procedure setError(lastErr :  in out Float;currentErr :Float) is
      begin
         lastErr := currentErr;
      end setError;
          
      procedure update(currentValue :in out Float) is
         error :Float;
         deriv :Float;
      begin
         -- calculate the error
         error := targetPoint - currentValue;
         -- calculate thr integral
         setIntegral(integral,error);
         -- calculate the derivative
         deriv := (error - lastError);
         -- save the error
         setError(lastError,error);
         -- update the currentValue
         currentValue := (pGain * error) + (iGain * integral) + (dGain * deriv);
         
         if currentValue > 800.0 then
            currentValue := 800.0;
         elsif currentValue < -800.0 then
            currentValue := -800.0;
        
         end if;
      end update;
      
      procedure reset(set :Float) is 
      begin
         targetPoint  := set;
         lastError := 0.0;
         integral  := 0.0;
      end reset;
      
   end pid_controller;
      
end PIDController;

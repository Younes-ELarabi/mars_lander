package body PIDController is

   protected body pid_controller is
      
      procedure init(target,kp,ki,kd :Float) is 
      begin
         reset(target);
         pGain := kp;
         iGain := ki;
         dGain := kd;
      end init;
      
      procedure setIntegral(error :Float) is
      begin
         integral := integral + error;
      end setIntegral;
      
      procedure setError(currentErr :Float) is
      begin
         lastError := currentErr;
      end setError;
          
      procedure update(currentValue : in out Float) is
         error :Float;
         deriv :Float;
      begin
         -- calculate the error
         error := targetPoint - currentValue;
         -- calculate thr integral
         setIntegral(error);
         -- calculate the derivative
         deriv := (error - lastError);
         -- save the error
         setError(error);
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
      
      procedure setNewTarget(target :Float) is 
      begin
         targetPoint := target;
      end setNewTarget;
      
   end pid_controller;
      
end PIDController;

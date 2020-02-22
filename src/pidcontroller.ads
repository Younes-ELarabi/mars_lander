package PIDController is
   
   protected pid_controller is 
      
      procedure init(target,kp,ki,kd :Float);
      
      procedure update(currentValue :in out Float);
      
      procedure reset(set :Float);
      
      procedure setNewTarget(target :Float);
      
      procedure setIntegral(error :Float);
      
      procedure setError(currentErr :Float);
      
   private 
      
      targetPoint :Float;
      pGain :Float;
      iGain :Float;
      dGain :Float;

      lastError :Float := 0.0;
      integral  :Float := 0.0;
     
   end pid_controller;

end PIDController;

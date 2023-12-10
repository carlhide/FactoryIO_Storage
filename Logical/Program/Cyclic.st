PROGRAM _CYCLIC
	
	IF var_StartReq AND NOT var_StartReqPreviousState THEN
		var_StartOrder := NOT var_StartOrder;
		var_Counter := 0;
	END_IF;    
	var_StartReqPreviousState := var_StartReq;
	

	IF var_StartOrder THEN
		var_Counter := var_Counter + 1;
	END_IF;            

	 
END_PROGRAM

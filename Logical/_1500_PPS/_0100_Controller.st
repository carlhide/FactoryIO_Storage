
PROGRAM _CYCLIC
	
	// INPUTS
		// OPC 
	v_LeftLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_LeftLimitSwitch;
	v_MiddleLimitSwitch 	:= Opc.In.PickAndPlace.Opc_IO_MiddleLimitSwitch;
	v_RightLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_RightLimitSwitch;
	v_MovingX				:= Opc.In.PickAndPlace.Opc_IO_MovingX;
	v_MovingY				:= Opc.In.PickAndPlace.Opc_IO_MovingZ;
	v_PositionX				:= Opc.In.PickAndPlace.Opc_IO_PosX;
	v_PositionZ				:= Opc.In.PickAndPlace.Opc_IO_PosZ;

		
		// GLOBAL
	
	
	// SEQUENCER
	CASE v_CurrentState OF
		STS_Idle:
			IF TRUE THEN
				v_CurrentState := STS_Transfer;
			END_IF;
			
		STS_WaitForLoad:
			IF TRUE THEN
				v_CurrentState := STS_Transfer;
			END_IF;
			
		STS_Load:
			IF TRUE THEN
				v_CurrentState := STS_Transfer;
			END_IF;
			
		STS_MoveToTarget:
			IF TRUE THEN
				v_CurrentState := STS_Transfer;
			END_IF;			
			
		STS_Unload:
			IF TRUE THEN
				v_CurrentState := STS_Transfer;
			END_IF;
	END_CASE;
	
	
	// ACTIONS
	
	
	
	
	// OUTPUTS
		// OPC 
	Opc.Out.PickAndPlace.Opc_IO_ForksLeft := v_ForksLeftExtendOrder;
	Opc.Out.PickAndPlace.Opc_IO_ForksRight := v_ForksRightExtendOrder;
	
	Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint := v_CraneXAxisSetPoint;
	Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint := v_CraneZAxisSetPoint;
		// GLOBAL
	//Storage Full	
	
END_PROGRAM

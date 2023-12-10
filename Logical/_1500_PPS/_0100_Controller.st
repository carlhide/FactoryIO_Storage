
PROGRAM _CYCLIC
	
	// INPUTS
		// OPC 
	v_LeftLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_LeftLimitSwitch;
	v_MiddleLimitSwitch 	:= Opc.In.PickAndPlace.Opc_IO_MiddleLimitSwitch;
	v_RightLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_RightLimitSwitch;
	v_MovingX				:= Opc.In.PickAndPlace.Opc_IO_MovingX;
	v_MovingZ				:= Opc.In.PickAndPlace.Opc_IO_MovingZ;
	v_PositionX				:= Opc.In.PickAndPlace.Opc_IO_PosX;
	v_PositionZ				:= Opc.In.PickAndPlace.Opc_IO_PosZ;

		
		// GLOBAL
	v_InfeedPickupAndStoreReq := Gv.ConveyorIn.ReadyForOffload;
	
	
	v_InPosition := ABS(v_PositionX - v_CraneXAxisSetPoint) < 0.05 AND ABS(v_PositionZ - v_CraneZAxisSetPoint) < 0.05 AND NOT v_MovingX AND NOT v_MovingZ;

	
	// SEQUENCER
	CASE v_CurrentState OF
		STS_Idle:
			
			IF v_InfeedPickupAndStoreReq THEN
				v_WOInfeedPickUp	:= TRUE;
				v_WOStoragePickup	:= FALSE;
				v_WOStorageDropoff := FALSE;
				v_WOOutfeedDropOff := FALSE;
				v_CraneXAxisSetPoint := PAR_HomeX;
				v_CraneZAxisSetPoint := PAR_HomeZ;
				v_CurrentState := STS_MoveToTarget;
			END_IF;
			
		STS_Load_Left:
			IF v_Loaded THEN
				IF v_WOInfeedPickUp THEN
					// Get coordinates for available cell and use as SetPoint
					v_CurrentState := STS_MoveToTarget;
				ELSIF v_WOStoragePickup THEN 
					// 
				ELSIF v_WOStorageDropoff THEN 
					// 
				ELSIF v_WOOutfeedDropOff THEN 
					//
				END_IF;	
			END_IF;
			
		STS_MoveToTarget:
			
			IF v_InPosition THEN
				IF v_WOInfeedPickUp THEN
					v_CurrentState := STS_Load_Left;
				ELSIF v_WOStoragePickup THEN
					v_CurrentState := STS_Unload;
				ELSIF v_WOStorageDropoff THEN
					v_CurrentState := STS_Unload;
				ELSIF v_WOOutfeedDropOff THEN
					v_CurrentState := STS_Unload;
				END_IF;
			END_IF;			
			
		STS_Unload:
			IF TRUE THEN
				v_CurrentState := STS_Idle;
			END_IF;
	END_CASE;
	
	
	// ACTIONS
	
	IF v_CurrentState = STS_Idle THEN 
		
		v_ForksLeftExtendOrder := FALSE;
		v_ForksRightExtendOrder := FALSE;
		v_CraneXAxisSetPoint := PAR_HomeX;
		v_CraneZAxisSetPoint := PAR_HomeZ;
		
	ELSIF v_CurrentState = STS_Load_Left THEN
		IF v_LoadSequence = 0 AND NOT v_Loaded THEN	
			IF NOT v_Loaded THEN
				v_LoadSequence := v_LoadSequence + 1;
			END_IF;	
		END_IF; 
		IF v_LoadSequence = 1 THEN				// Decrease Z setpoint by a bit
			v_CraneZAxisSetPoint := v_CraneZAxisSetPoint - PAR_LoadOffLoadZDelta;
			v_LoadSequence := v_LoadSequence + 1;
		END_IF;	
		
		IF v_LoadSequence = 2 THEN				// Wait for fork to be in Z position
			IF v_InPosition THEN
				v_LoadSequence := v_LoadSequence + 1;
			END_IF;
		END_IF;	
		
		IF v_LoadSequence = 3 THEN				// Extend forks and wait for in position
			v_ForksLeftExtendOrder := TRUE;
			IF v_LeftLimitSwitch THEN
				v_LoadSequence := v_LoadSequence + 1;
			END_IF;
		END_IF;			
		
		IF v_LoadSequence = 4 THEN				// Raise by delta two time
			v_CraneZAxisSetPoint := v_CraneZAxisSetPoint + PAR_LoadOffLoadZDelta*2;
			v_LoadSequence := v_LoadSequence + 1;
		END_IF;	
		
		IF v_LoadSequence = 5 THEN				//	Wait for position			
			IF 	v_InPosition THEN
				v_LoadSequence := v_LoadSequence + 1;
			END_IF;
		END_IF;	
		
		IF v_LoadSequence = 6 THEN				//	Retract forks	
			v_ForksLeftExtendOrder := FALSE;
			IF v_MiddleLimitSwitch THEN
				v_LoadSequence := v_LoadSequence + 1;
			END_IF;
		END_IF;	
		
		IF v_LoadSequence = 7 THEN				//	Crane is loaded
			v_Loaded := TRUE;
			v_LoadSequence := 0;
		END_IF;
	
	END_IF;		
	
	
	// OUTPUTS
		// OPC 
	Opc.Out.PickAndPlace.Opc_IO_ForksLeft 		:= v_ForksLeftExtendOrder;
	Opc.Out.PickAndPlace.Opc_IO_ForksRight 		:= v_ForksRightExtendOrder;
	
	Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint 	:= v_CraneXAxisSetPoint;
	Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= v_CraneZAxisSetPoint;
		// GLOBAL
	//Storage Full	
	
END_PROGRAM

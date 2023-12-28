
PROGRAM _CYCLIC
	
	IF FirstScan THEN
		FirstScan := FALSE;
		PAR_LoadOffLoadZDelta := 0.2;
		PAR_HomeX := 0.00;
		PAR_HomeZ := 0.18;
		fb_Crane.in_rXSetPointReq := PAR_HomeX;
		fb_Crane.in_rZSetPointReq := PAR_HomeZ;
		
		(* CONSTANTS
		STS_Init := 0;
		STS_Idle := 1;
		STS_LoadFromConveyor := 2;
		STS_LoadFromStorage := 3;
		STS_OffloadInStorage := 4; 
		STS_OffloadOnConveyour := 5;
		*)
		
	END_IF;		
	
	//IF NOT Gv.StorageController.Dummy THEN
	//	EXIT;
	//END_IF;		
	
	// INPUTS
		// OPC 
	v_LeftLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_LeftLimitSwitch;
	v_MiddleLimitSwitch 	:= Opc.In.PickAndPlace.Opc_IO_MiddleLimitSwitch;
	v_RightLimitSwitch 		:= Opc.In.PickAndPlace.Opc_IO_RightLimitSwitch;
	v_MovingX				:= Opc.In.PickAndPlace.Opc_IO_MovingX;
	v_MovingZ				:= Opc.In.PickAndPlace.Opc_IO_MovingZ;
	v_ActualPositionX				:= Opc.In.PickAndPlace.Opc_IO_PosX;
	v_ActualPositionZ				:= Opc.In.PickAndPlace.Opc_IO_PosZ;
	
		// GLOBAL
	v_InfeedPickupAndStoreReq := Gv.ConveyorIn.ReadyForOffload;
	v_StorageFull := FALSE; // IMPLEMENT

	fb_Crane(in_rXActualPos := v_ActualPositionX,
				in_rZActualPos := v_ActualPositionZ,
				in_xInterlock := FALSE);
	
	fb_Loader(
		in_xLimitRight := v_RightLimitSwitch, 
				in_xLimitLeft := v_LeftLimitSwitch, 
				in_xLimitMiddle := v_MiddleLimitSwitch, 
				in_xInterlock := FALSE, 
				in_rXActualPos := v_ActualPositionX, 
				in_rZActualPos := v_ActualPositionZ, 
				in_xMovingX := v_MovingX, 
				in_xMovingZ := v_MovingZ, 
				in_rLoadDeltaZ := PAR_LoadOffLoadZDelta);
	
	// Main state machine handling based on current step
	CASE STS_PickAndPlace.CurrentStep OF

    	STS_Init:											
			STS_PickAndPlace.NextStep := STS_Idle;
		
		STS_Idle:		
			IF v_InfeedPickupAndStoreReq AND NOT v_StorageFull THEN
				STS_PickAndPlace.NextStep := STS_LoadFromConveyor;
			END_IF;

		STS_LoadFromConveyor:
			(* START MOVE TO CONVEYOR AND LOAD *)
			CASE SEQ_LoadFromConveyor.CurrentStep OF
				0:
					IF SEQ_LoadFromConveyor.OnEntryFlag THEN
						SEQ_LoadFromConveyor.OnEntryFlag := FALSE;
						fb_Crane.in_rXSetPointReq := PAR_HomeX;
						fb_Crane.in_rZSetPointReq := PAR_HomeZ;
					END_IF;
					
					IF fb_Crane.out_sStatus.Idle AND NOT SEQ_LoadFromConveyor.OnEntryFlag THEN
						SEQ_LoadFromConveyor.NextStep := SEQ_LoadFromConveyor.CurrentStep + 1;
					END_IF;		
				1: 
					fb_Loader.in_xLoadLeftReq := TRUE;
					
					IF fb_Loader.out_xLoaded AND NOT SEQ_LoadFromConveyor.OnEntryFlag THEN
						SEQ_LoadFromConveyor.NextStep := 0;
					END_IF;		
					
			
			END_CASE;
			IF SEQ_LoadFromConveyor.CurrentStep <> SEQ_LoadFromConveyor.NextStep THEN
				SEQ_LoadFromConveyor.CurrentStep := SEQ_LoadFromConveyor.NextStep;
				SEQ_LoadFromConveyor.OnEntryFlag := TRUE;
			END_IF;
			(* END MOVE TO CONVEYOR AND LOAD *)
		
		IF fb_Loader.out_xLoaded AND NOT SEQ_LoadFromConveyor.OnEntryFlag THEN		
			SEQ_LoadFromConveyor.NextStep := STS_OffloadInStorage;	
		END_IF;		
		
		STS_OffloadInStorage:
			CASE SQS_OffloadInStorage.CurrentStep OF

				0:	// Move to empty space
					IF SQS_OffloadInStorage.OnEntryFlag THEN
						// Logic to get coordinate
						// fb_Crane.in_rXSetPointReq := PAR_HomeX;
						// fb_Crane.in_rZSetPointReq := PAR_HomeZ;
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
					END_IF;

					// Cyclic code

					IF fb_Crane.out_sStatus.Idle AND NOT SQS_OffloadInStorage.OnEntryFlag THEN
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;		
				1:	// Offload in storage
					IF SQS_OffloadInStorage.OnEntryFlag THEN
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
					END_IF;

					// Cyclic code
				(*
					IF ConditionToTransition THEN
						SQS_OffloadInStorage.NextStep :=  SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;

				2:        
					IF SQS_OffloadInStorage.OnEntryFlag THEN
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
					END_IF;

					// Cyclic code

					IF ConditionToTransition THEN
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;
    
					IF  SQS_OffloadInStorage.CurrentStep <>  SQS_OffloadInStorage.NextStep THEN
						SQS_OffloadInStorage.CurrentStep :=  SQS_OffloadInStorage.NextStep;
						SQS_OffloadInStorage.OnEntryFlag := TRUE;
				END_IF;
				*)
			END_CASE;
     

		//STS_ReturnToHome:
			// Implement logic for returning to the home position
		//	STS_PickAndPlace.NextStep := STS_Idle;

		// Add additional states and handling as necessary
	
	END_CASE;
	
	// Transition to the next step if it's different from the current
	IF STS_PickAndPlace.NextStep <> STS_PickAndPlace.CurrentStep THEN
		STS_PickAndPlace.CurrentStep := STS_PickAndPlace.NextStep;
		STS_PickAndPlace.OnEntryFlag := TRUE; // Set the on-entry flag for the new state
	END_IF;
	
	
	(* FOR TESTING 
	
	fb_Crane(in_rXActualPos := v_ActualPositionX,
			 in_rZActualPos := v_ActualPositionZ,
			 in_rXSetPointReq := test_rPosXReq,
			 in_rZSetPointReq := test_rPosZReq,
			 in_xInterlock := FALSE);
	
	fb_Loader(in_xLoadLeftReq := test_xLoadLeft,
				in_xLoadRightReq := test_xLoadRight,
				in_xUnloadLeftReq := test_xUnloadLeft,
				in_xUnloadRightReq := test_xUnloadRight,
				in_xLimitRight := v_RightLimitSwitch, 
				in_xLimitLeft := v_LeftLimitSwitch, 
				in_xLimitMiddle := v_MiddleLimitSwitch, 
				in_xInterlock := FALSE, 
				in_rXActualPos := v_ActualPositionX, 
				in_rZActualPos := v_ActualPositionZ, 
				in_xMovingX := v_MovingX, 
				in_xMovingZ := v_MovingZ, 
				in_rLoadDeltaZ := PAR_LoadOffLoadZDelta);
	*)
	
	v_ForksLeftExtendOrder := fb_Loader.out_xForksLeftOrder;
	v_ForksRightExtendOrder := fb_Loader.out_xForksRightOrder;
	v_CraneXAxisSetPoint := fb_Loader.out_rXSetPoint;
	v_CraneZAxisSetPoint := fb_Loader.out_rZSetPoint;
	
	
	// OUTPUTS
		// OPC 
	Opc.Out.PickAndPlace.Opc_IO_ForksLeft 		:= v_ForksLeftExtendOrder;
	Opc.Out.PickAndPlace.Opc_IO_ForksRight 		:= v_ForksRightExtendOrder;
	
	Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint 	:= fb_Crane.out_rXSetPoint;
	IF fb_Crane.out_sStatus.InProgress THEN
		Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Crane.out_rZSetPoint;
	ELSIF fb_Loader.out_sStatus.InProgress THEN		
		Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Loader.out_rZSetPoint;
	END_IF;
		// GLOBAL
	//Storage Full	
	
END_PROGRAM

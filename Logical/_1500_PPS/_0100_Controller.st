
PROGRAM _CYCLIC
	

	
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
	
	IF FirstScan THEN
		FirstScan := FALSE;
		PAR_LoadOffLoadZDelta := 0.2;
		PAR_HomeX := 0.00;
		PAR_HomeZ := 0.18;
		fb_Crane.in_rXSetPointReq := PAR_HomeX;
		fb_Crane.in_rZSetPointReq := PAR_HomeZ;
		v_xTest := FALSE;
		
		(* CONSTANTS
		STS_Init := 0;
		STS_Idle := 1;
		STS_LoadFromConveyor := 2;
		STS_LoadFromStorage := 3;
		STS_OffloadInStorage := 4; 
		STS_OffloadOnConveyour := 5;
		*)
		
	END_IF;		
	
	// Main state machine handling based on current step
	CASE STS_PickAndPlace.CurrentStep OF

    	STS_Init:											
			STS_PickAndPlace.NextStep := STS_Idle;
		
		STS_Idle:
			IF STS_PickAndPlace.OnEntryFlag THEN
				STS_PickAndPlace.OnEntryFlag := FALSE;
				fb_Crane.in_rXSetPointReq := PAR_HomeX;
				fb_Crane.in_rZSetPointReq := PAR_HomeZ;
			END_IF;

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
					IF SEQ_LoadFromConveyor.OnEntryFlag THEN
						SEQ_LoadFromConveyor.OnEntryFlag := FALSE;
					END_IF;		
					fb_Loader.in_xLoadLeftReq := TRUE;
					
					IF fb_Loader.out_xLoaded AND NOT SEQ_LoadFromConveyor.OnEntryFlag THEN
						fb_Loader.in_xLoadLeftReq := FALSE;
						SEQ_LoadFromConveyor.NextStep := SEQ_LoadFromConveyor.CurrentStep + 1;
					END_IF;		

				2: 
					IF SEQ_LoadFromConveyor.OnEntryFlag THEN
						SEQ_LoadFromConveyor.OnEntryFlag := FALSE;
					END_IF;
					SEQ_LoadFromConveyor.NextStep := 0;
					STS_PickAndPlace.NextStep := STS_OffloadInStorage;
					
			
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
			IF STS_PickAndPlace.OnEntryFlag THEN
				STS_PickAndPlace.OnEntryFlag := FALSE;
				SQS_OffloadInStorage.OnEntryFlag := TRUE;
			END_IF;
			CASE SQS_OffloadInStorage.CurrentStep OF

				0:	// Move to empty space
					IF SQS_OffloadInStorage.OnEntryFlag THEN	// ENTRY CODE
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
						
					END_IF;

					// Cyclic code
					Gv.StorageRackSystem.StoragePlaceRequest := TRUE;

					IF NOT SQS_OffloadInStorage.OnEntryFlag THEN // EXIT CODE
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;		

				1:	// Set coordinates
					IF SQS_OffloadInStorage.OnEntryFlag THEN	// ENTRY CODE
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
						fb_Crane.in_rXSetPointReq := Gv.StorageRackSystem.StoragePlaceAcknowledge.coordinate.x;
						fb_Crane.in_rZSetPointReq := Gv.StorageRackSystem.StoragePlaceAcknowledge.coordinate.z;
						
					END_IF;

					// Cyclic code
					IF NOT SQS_OffloadInStorage.OnEntryFlag THEN
						
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;		
				
					
				2:	// Wait for arrival
					IF SQS_OffloadInStorage.OnEntryFlag THEN	// ENTRY CODE
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
					END_IF;

					// Cyclic code

					IF fb_Crane.out_sStatus.Idle THEN // EXIT CODE
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;	

				3:	// Offload
					IF SQS_OffloadInStorage.OnEntryFlag THEN	// ENTRY CODE
						SQS_OffloadInStorage.OnEntryFlag := FALSE;
					END_IF;

					fb_Loader.in_xUnloadRightReq := TRUE;
					

					IF NOT SQS_OffloadInStorage.OnEntryFlag AND NOT fb_Loader.out_xLoaded THEN // EXIT CODE
						fb_Loader.in_xUnloadRightReq := FALSE;
						Gv.StorageRackSystem.StoragePlaceAcknowledge.available := FALSE;
						Gv.StorageRackSystem.StoragePlaceRequest := FALSE;
						SQS_OffloadInStorage.NextStep := SQS_OffloadInStorage.CurrentStep + 1;
					END_IF;	

				4:
					SQS_OffloadInStorage.NextStep := 0;
					STS_PickAndPlace.NextStep := STS_Idle;
				
			END_CASE;
			IF SQS_OffloadInStorage.CurrentStep <> SQS_OffloadInStorage.NextStep THEN
				SQS_OffloadInStorage.CurrentStep := SQS_OffloadInStorage.NextStep;
				SQS_OffloadInStorage.OnEntryFlag := TRUE;
			END_IF;
     

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
	Gv.PickAndPlaceSystem.ActualPositionX := v_ActualPositionX;
	Gv.PickAndPlaceSystem.ActualPositionZ := v_ActualPositionZ;
	
	
	// OUTPUTS
	// OPC 
	IF NOT v_xTest THEN
		
		Opc.Out.PickAndPlace.Opc_IO_ForksLeft 		:= v_ForksLeftExtendOrder;
		Opc.Out.PickAndPlace.Opc_IO_ForksRight 		:= v_ForksRightExtendOrder;
		
		Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint 	:= fb_Crane.out_rXSetPoint;
		IF fb_Crane.out_sStatus.InProgress THEN
			Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Crane.out_rZSetPoint;
		ELSIF fb_Loader.out_sStatus.InProgress THEN		
			Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Loader.out_rZSetPoint;
		END_IF;
	END_IF;
		// GLOBAL
	//Storage Full	
	
END_PROGRAM

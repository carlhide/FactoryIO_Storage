
PROGRAM _CYCLIC
	
	IF FirstScan THEN
		FirstScan := FALSE;
		PAR_LoadOffLoadZDelta := 0.2;
		PAR_HomeX := 0.00;
		PAR_HomeZ := 0.18;
		fb_Crane.in_rXSetPointReq := PAR_HomeX;
		fb_Crane.in_rZSetPointReq := PAR_HomeZ;
		
	END_IF;		
	
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
	

	
	v_ForksLeftExtendOrder := fb_Loader.out_xForksLeftOrder;
	v_ForksRightExtendOrder := fb_Loader.out_xForksRightOrder;
	v_CraneXAxisSetPoint := fb_Loader.out_rXSetPoint;
	v_CraneZAxisSetPoint := fb_Loader.out_rZSetPoint;
	
	
	// OUTPUTS
		// OPC 
	Opc.Out.PickAndPlace.Opc_IO_ForksLeft 		:= v_ForksLeftExtendOrder;
	Opc.Out.PickAndPlace.Opc_IO_ForksRight 		:= v_ForksRightExtendOrder;
	
	IF fb_Crane.out_sStatus.InProgress THEN
		Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint 	:= fb_Crane.out_rXSetPoint;
		Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Crane.out_rZSetPoint;
	ELSIF fb_Loader.out_sStatus.InProgress THEN		
		Opc.Out.PickAndPlace.Opc_IO_XAxisSetPoint 	:= fb_Loader.out_rXSetPoint;
		Opc.Out.PickAndPlace.Opc_IO_ZAxisSetPoint 	:= fb_Loader.out_rZSetPoint;
	END_IF;
		// GLOBAL
	//Storage Full	
	
END_PROGRAM

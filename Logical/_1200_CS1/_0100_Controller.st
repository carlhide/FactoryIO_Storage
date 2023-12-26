PROGRAM _CYCLIC
	
	// INPUTS
		// OPC Inputs
	v_BoxAtEntry := NOT Opc.In.ConveyorInfeed.Opc_IO_AtEntry;
	v_BoxAtLoad := NOT Opc.In.ConveyorInfeed.Opc_IO_AtLoad;
	
    	// Module Inputs
	v_OffloadingActive := Gv.PickAndPlaceSystem.Offloading.InProgress;
	
	
	CASE v_CurrentState OF
		STS_Idle:
			IF v_BoxAtEntry AND NOT v_BoxAtLoad AND NOT v_OffloadingActive THEN
				v_CurrentState := STS_Transfer;
			END_IF;
			
		STS_Transfer:
			IF v_BoxAtLoad THEN
				v_CurrentState := STS_WaitForOffload;
			END_IF;
			
		STS_WaitForOffload:
			IF NOT v_BoxAtLoad AND NOT v_OffloadingActive THEN
				v_ReadyToOffload := FALSE;
				v_CurrentState := STS_Idle;
			END_IF;
	END_CASE;
	
	
	IF v_CurrentState = STS_Idle THEN 
		
		v_EntryConveyorRunOrder := FALSE;
		v_LoadingConveyorRunOrder := FALSE;
		
	ELSIF v_CurrentState = STS_Transfer THEN
		
		v_EntryConveyorRunOrder := TRUE;
		v_LoadingConveyorRunOrder := TRUE;
		
	ELSIF v_CurrentState = STS_WaitForOffload THEN
		
		v_ReadyToOffload := TRUE;
		v_EntryConveyorRunOrder := FALSE;
		v_LoadingConveyorRunOrder := FALSE;
		
	ELSE
		// State error
	END_IF;		
	
	
	
	
	// OUTPUTS
		// OPC outputs
	Opc.Out.ConveyorInfeed.Opc_IO_EntryConveyor := v_EntryConveyorRunOrder;
	Opc.Out.ConveyorInfeed.Opc_IO_LoadingConveyor := v_LoadingConveyorRunOrder;
	
		// Module output
	Gv.ConveyorIn.ReadyForOffload := v_ReadyToOffload;
	
END_PROGRAM

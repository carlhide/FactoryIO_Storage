
TYPE
	UDT_OpcInput : 	STRUCT 
		StorageController : UDT_StorageControllerInput;
		ControlSystem : UDT_ControlSystemInput;
		ConveyorInfeed : UDT_ConveyorInfeedInput;
		ConveyorOutfeed : UDT_ConveyorOutfeedInput;
		StorageRack : UDT_StorageRackSystemInput;
		PickAndPlace : UDT_PickAndPlaceSystemInput;
		Safety : UDT_SafetySystemInput;
		HMI : UDT_HMIInput;
	END_STRUCT;
	UDT_OpcOutput : 	STRUCT 
		StorageController : UDT_StorageControllerOutput;
		ControlSystem : UDT_ControlSystemOutput;
		ConveyorInfeed : UDT_ConveyorInfeedOutput;
		ConveyorOutfeed : UDT_ConveyorOutfeedOutput;
		StorageRack : UDT_StorageRackSystemOutput;
		PickAndPlace : UDT_PickAndPlaceSystemOutput;
		SafetySystem : UDT_SafetySystemOutput;
		HMI : UDT_HMIOutput;
	END_STRUCT;
	UDT_StorageControllerInput : 	STRUCT 
		Opc_IO_Factory_Reset : BOOL;
		Opc_IO_Factory_Running : BOOL;
		Opc_IO_Factory_Paused : BOOL;
	END_STRUCT;
	UDT_ControlSystemInput : 	STRUCT 
		Opc_IO_StartButton : BOOL;
		Opc_IO_StopButton : BOOL;
		Opc_IO_ManualSwitch : BOOL;
		Opc_IO_AutoSwitch : BOOL;
	END_STRUCT;
	UDT_ConveyorInfeedInput : 	STRUCT 
		Opc_IO_AtEntry : BOOL;
		Opc_IO_AtLoad : BOOL;
	END_STRUCT;
	UDT_ConveyorOutfeedInput : 	STRUCT 
		Opc_IO_AtExit : BOOL;
		Opc_IO_AtUnload : BOOL;
	END_STRUCT;
	UDT_StorageRackSystemInput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_PickAndPlaceSystemInput : 	STRUCT 
		Opc_IO_PosZ : REAL;
		Opc_IO_PosX : REAL;
		Opc_IO_MovingX : BOOL;
		Opc_IO_MovingZ : BOOL;
		Opc_IO_LeftLimitSwitch : BOOL;
		Opc_IO_RightLimitSwitch : BOOL;
		Opc_IO_MiddleLimitSwitch : BOOL;
	END_STRUCT;
	UDT_SafetySystemInput : 	STRUCT 
		Opc_IO_EmergencyStop1 : BOOL;
	END_STRUCT;
	UDT_HMIInput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_StorageControllerOutput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_ControlSystemOutput : 	STRUCT 
		Opc_IO_ResetLight : BOOL;
		Opc_IO_StopLight : BOOL;
		Opc_IO_StartLight : BOOL;
	END_STRUCT;
	UDT_ConveyorInfeedOutput : 	STRUCT 
		Opc_IO_LoadingConveyor : BOOL;
		Opc_IO_EntryConveyor : BOOL;
	END_STRUCT;
	UDT_ConveyorOutfeedOutput : 	STRUCT 
		Opc_IO_UnloadConveyor : BOOL;
		Opc_IO_ExitConveyor : BOOL;
	END_STRUCT;
	UDT_StorageRackSystemOutput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_PickAndPlaceSystemOutput : 	STRUCT 
		Opc_IO_ForksRight : BOOL;
		Opc_IO_XAxisSetPoint : REAL;
		Opc_IO_ZAxisSetPoint : REAL;
		Opc_IO_ForksLeft : BOOL;
	END_STRUCT;
	UDT_SafetySystemOutput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_HMIOutput : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
END_TYPE


TYPE
	UDT_Opc : 	STRUCT 
		In : UDT_OPCInput;
		Out : UDT_OPCOutput;
	END_STRUCT;
	UDT_Global : 	STRUCT 
		StorageController : UDT_StorageController;
		ControlSystem : UDT_ControlSystem;
		ConveyorIn : UDT_ConveyorSystem;
		ConveyorOut : UDT_ConveyorSystem;
		StorageRackSystem : UDT_StorageRackSystem;
		HMI : UDT_HMI;
		PickAndPlaceSystem : UDT_PickAndPlaceSystem;
		SafetySystem : UDT_SafetySystem;
	END_STRUCT;
END_TYPE

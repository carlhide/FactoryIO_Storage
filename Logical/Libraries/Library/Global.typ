
TYPE
	UDT_Opc : 	STRUCT 
		In : UDT_OpcInput;
		Out : UDT_OpcOutput;
	END_STRUCT;
	UDT_Global : 	STRUCT 
		StorageController : UDT_StorageController;
		ControlSystem : UDT_ControlSystem;
		ConveyorIn : UDT_ConveyorInfeedSystem;
		ConveyorOut : UDT_ConveyorOutfeedSystem;
		StorageRackSystem : UDT_StorageRackSystem;
		HMI : UDT_HMI;
		PickAndPlaceSystem : UDT_PickAndPlaceSystem;
		SafetySystem : UDT_SafetySystem;
	END_STRUCT;
END_TYPE

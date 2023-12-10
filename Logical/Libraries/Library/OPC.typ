
TYPE
	UDT_OPCInput : 	STRUCT 
		StorageController : UDT_StorageControllerInput;
		ControlSystem : UDT_ControlSystemInput;
		ConveyorInfeed : UDT_ConveyorInfeedInput;
		ConveyorOutfeed : UDT_ConveyorOutfeedInput;
		StorageRack : UDT_StorageRackSystemInput;
		PickAndPlace : UDT_PickAndPlaceSystemInput;
		Safety : UDT_SafetySystemInput;
		HMI : UDT_HMIInput;
	END_STRUCT;
	UDT_OPCOutput : 	STRUCT 
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
	END_STRUCT;
	UDT_ControlSystemInput : 	STRUCT 
	END_STRUCT;
	UDT_ConveyorInfeedInput : 	STRUCT 
		AtEntry : BOOL;
		AtLoad : BOOL;
	END_STRUCT;
	UDT_ConveyorOutfeedInput : 	STRUCT 
		AtExit : BOOL;
		AtUnload : BOOL;
	END_STRUCT;
	UDT_StorageRackSystemInput : 	STRUCT 
	END_STRUCT;
	UDT_PickAndPlaceSystemInput : 	STRUCT 
	END_STRUCT;
	UDT_SafetySystemInput : 	STRUCT 
	END_STRUCT;
	UDT_HMIInput : 	STRUCT 
	END_STRUCT;
	UDT_StorageControllerOutput : 	STRUCT 
	END_STRUCT;
	UDT_ControlSystemOutput : 	STRUCT 
	END_STRUCT;
	UDT_ConveyorInfeedOutput : 	STRUCT 
	END_STRUCT;
	UDT_ConveyorOutfeedOutput : 	STRUCT 
	END_STRUCT;
	UDT_StorageRackSystemOutput : 	STRUCT 
	END_STRUCT;
	UDT_PickAndPlaceSystemOutput : 	STRUCT 
	END_STRUCT;
	UDT_SafetySystemOutput : 	STRUCT 
	END_STRUCT;
	UDT_HMIOutput : 	STRUCT 
	END_STRUCT;
END_TYPE

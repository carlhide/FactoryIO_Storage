
TYPE
	UDT_StorageController : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_ControlSystem : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_ConveyorInfeedSystem : 	STRUCT 
		ReadyForOffload : BOOL;
	END_STRUCT;
	UDT_ConveyorOutfeedSystem : 	STRUCT 
		ReadyForOnload : BOOL;
	END_STRUCT;
	UDT_StorageRackSystem : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_HMI : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_PickAndPlaceSystem : 	STRUCT 
		Offloading : UDT_Sequence;
		Loading : UDT_Sequence;
	END_STRUCT;
	UDT_SafetySystem : 	STRUCT 
		SafetyStop : BOOL;
		ControlledStop : BOOL;
	END_STRUCT;
END_TYPE


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
		Params: TParameters;
	END_STRUCT;

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
		StoragePlaceRequest : BOOL;
		StoragePlaceAcknowledge: TStorageSlot;
		(*StorageRackMatrix : ARRAY[1..10, 1..10] OF TStorageSlot;*)
	END_STRUCT;
	UDT_HMI : 	STRUCT 
		Dummy : BOOL;
	END_STRUCT;
	UDT_PickAndPlaceSystem : 	STRUCT 
		Offloading : UDT_Sequence;
		Loading : UDT_Sequence;
		ActualPositionX: REAL;
		ActualPositionZ: REAL;
		
	END_STRUCT;
	UDT_SafetySystem : 	STRUCT 
		SafetyStop : BOOL;
		ControlledStop : BOOL;
	END_STRUCT;

	TParameters : 	STRUCT 
		StorageSizeX : INT;
		StorageSizeZ : INT;
		FirstSlotXPos : REAL;
		FirstSlotZPos : REAL;
		LastSlotXPos : REAL;
		LastSlotZPos : REAL;
	END_STRUCT;

END_TYPE


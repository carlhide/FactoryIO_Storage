
TYPE
	UDT_Sequence : 	STRUCT 
		Error : BOOL;
		Idle : BOOL;
		InProgress : BOOL;
		Requested : BOOL;
	END_STRUCT;
	UDT_Sequencer : 	STRUCT 
		OnEntryFlag : BOOL := TRUE;
		CurrentStep : INT := 0;
		NextStep : INT := 0;
	END_STRUCT;
END_TYPE

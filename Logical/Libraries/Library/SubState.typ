
TYPE
	UDT_Sequence : 	STRUCT 
		Error : BOOL;
		Idle : BOOL;
		InProgress : BOOL;
		Requested : BOOL;
	END_STRUCT;
	UDT_Sequencer : 	STRUCT 
		OnEntryFlag : USINT;
		CurrectStep : USINT;
		NextStep : USINT;
	END_STRUCT;
END_TYPE

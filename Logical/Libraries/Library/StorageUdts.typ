TYPE
	
	TCoordinate : STRUCT 
		x : REAL; 
		z : REAL; 
	END_STRUCT;

	
	TBoxData : STRUCT 
		id : STRING; 
		weight : REAL; 
		isvalid : BOOL; 
	END_STRUCT;

	TStorageSlot : STRUCT
		number : INT; 
		coordinate : TCoordinate;
		available : BOOL;
		box : TBoxData;
	END_STRUCT;
END_TYPE

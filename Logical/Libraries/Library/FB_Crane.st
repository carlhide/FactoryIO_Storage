
(* TODO: Add your comment here *)
FUNCTION_BLOCK FB_Crane
//MovX	REAL	FALSE	VAR_INPUT		FALSE	FALSE		 	 	 	 	48
//	MovY	REAL	FALSE	VAR_INPUT		FALSE	FALSE		 	 	 	 	49
//	Status	UDT_Sequence		VAR_OUTPUT		FALSE	FALSE		 	 	 	 	7
//	XSetPoint	REAL		VAR_OUTPUT		FALSE	TRUE		 	 	 	 	-1
//	ZSetPoint	REAL		VAR_OUTPUT		FALSE	TRUE		 	 	 	 	-1

	
	NewRequest := NOT(PreviousXSetPoint = in_rXSetPointReq AND PreviousZSetPoint = in_rZSetPointReq);
		
	IF FirstScan THEN
		FirstScan := FALSE;
		out_sStatus.Idle := TRUE;
		out_rXSetPoint := in_rXActualPos;
		out_rZSetPoint := in_rZActualPos;
	END_IF;		
	
	IF NOT in_xInterlock THEN
		IF NewRequest THEN
			out_rXSetPoint := in_rXSetPointReq;
			out_rZSetPoint := in_rZSetPointReq;
			out_sStatus.InProgress := TRUE;
			out_sStatus.Idle := FALSE;
		END_IF;
	ELSE
		out_rXSetPoint := in_rXActualPos;
		out_rZSetPoint := in_rZActualPos;
	END_IF;		
	
	InPosition := ABS(out_rXSetPoint-in_rXActualPos)<0.05 AND ABS(out_rZSetPoint-in_rZActualPos)<0.05;
	IF InPosition AND out_sStatus.InProgress THEN 
		out_sStatus.InProgress := FALSE;
		out_sStatus.Idle := TRUE;
	END_IF;		
	
	PreviousXSetPoint := in_rXSetPointReq;
	PreviousZSetPoint := in_rZSetPointReq;
	
	
END_FUNCTION_BLOCK

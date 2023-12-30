
(* TODO: Add your comment here *)
FUNCTION_BLOCK FB_Loader
	
	v_InPosition := NOT in_xMovingX AND NOT in_xMovingZ;
	
	Load := in_xLoadRightReq OR in_xLoadLeftReq;
	Unload := in_xUnloadLeftReq OR in_xUnloadRightReq;
	OperateLeft := in_xUnloadLeftReq OR in_xLoadLeftReq;
	OperateRight := in_xUnloadRightReq OR in_xLoadRightReq;
	
	IF NOT out_sStatus.InProgress AND NOT (in_xLoadRightReq OR in_xLoadLeftReq OR in_xUnloadLeftReq OR in_xUnloadRightReq) THEN
		v_LoadSequence := 0;
		out_sStatus.InProgress := FALSE;
		out_sStatus.Idle := TRUE;
		out_xForksLeftOrder := FALSE;
		out_xForksRightOrder := FALSE;
	END_IF;		
	
	IF Load THEN
		CASE v_LoadSequence OF
			0:
				out_sStatus.InProgress := FALSE;
				out_sStatus.Idle := TRUE;
				out_xForksLeftOrder := FALSE;
				out_xForksRightOrder := FALSE;
				IF NOT out_xLoaded THEN
					v_LoadSequence := 1;
					
				END_IF;
			1:
				out_sStatus.InProgress := TRUE;
				out_rZSetPoint := in_rZActualPos - in_rLoadDeltaZ;
				v_LoadSequence := 2;
			2:
				IF v_InPosition THEN
					v_LoadSequence := 3;
				END_IF;
			3:
				
					
				IF OperateLeft THEN
					out_xForksLeftOrder := TRUE;
					IF in_xLimitLeft THEN
						v_LoadSequence := 4;
					END_IF;
				ELSIF OperateRight THEN 	
					out_xForksRightOrder := TRUE;
					IF in_xLimitRight THEN
						v_LoadSequence := 4;
					END_IF;
				END_IF;	
					
			4:
				out_rZSetPoint := in_rZActualPos + in_rLoadDeltaZ*2;
				v_LoadSequence := 5;
			5:
				IF v_InPosition THEN
					v_LoadSequence := 6;
				END_IF;
			6:
				out_xForksLeftOrder := FALSE;
				out_xForksRightOrder := FALSE;
				IF in_xLimitMiddle THEN
					v_LoadSequence := 7;
				END_IF;
			7:
				out_rZSetPoint := in_rZActualPos - in_rLoadDeltaZ;
				v_LoadSequence := 8;
			8:
				IF v_InPosition THEN
					v_LoadSequence := 9;
				END_IF;
			9:
				out_xLoaded := TRUE;
				out_sStatus.InProgress := FALSE;
				out_sStatus.Idle := TRUE;
				v_LoadSequence := 0;
		END_CASE
	ELSIF Unload THEN
		CASE v_LoadSequence OF
			0:
				out_sStatus.InProgress := FALSE;
				out_sStatus.Idle := TRUE;
				out_xForksLeftOrder := FALSE;
				out_xForksRightOrder := FALSE;
				IF out_xLoaded THEN
					v_LoadSequence := 1;
					
				END_IF;
			1:
				out_sStatus.InProgress := TRUE;
				out_rZSetPoint := in_rZActualPos + in_rLoadDeltaZ;
				v_LoadSequence := 2;
			2:
				IF v_InPosition THEN
					v_LoadSequence := 3;
				END_IF;
			3:
				IF OperateRight THEN 
					out_xForksRightOrder := TRUE;
					IF in_xLimitRight THEN
						v_LoadSequence := 4;
					END_IF;
				ELSIF OperateLeft THEN
					out_xForksLeftOrder := TRUE;
					IF in_xLimitLeft THEN
						v_LoadSequence := 4;
					END_IF;
				END_IF;
			4:
				out_rZSetPoint := in_rZActualPos - in_rLoadDeltaZ * 2;
				v_LoadSequence := 5;
			5:
				IF v_InPosition THEN
					v_LoadSequence := 6;
				END_IF;
			6:
				out_xForksLeftOrder := FALSE;
				out_xForksRightOrder := FALSE;
				IF in_xLimitMiddle THEN
					v_LoadSequence := 7;
				END_IF;
			7:
				out_rZSetPoint := in_rZActualPos + in_rLoadDeltaZ;
				v_LoadSequence := 8;
			8:
				IF v_InPosition THEN
					v_LoadSequence := 9;
				END_IF;
			9:
				out_xLoaded := FALSE;
				v_LoadSequence := 0;
		END_CASE
	END_IF

END_FUNCTION_BLOCK
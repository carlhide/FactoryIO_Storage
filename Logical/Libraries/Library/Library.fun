
{REDUND_ERROR} FUNCTION_BLOCK FB_Loader (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		in_xLimitRight : {REDUND_UNREPLICABLE} BOOL;
		in_xLimitLeft : {REDUND_UNREPLICABLE} BOOL;
		in_xLimitMiddle : {REDUND_UNREPLICABLE} BOOL;
		in_xInterlock : {REDUND_UNREPLICABLE} BOOL;
		in_xMovingX : {REDUND_UNREPLICABLE} BOOL;
		in_xMovingZ : {REDUND_UNREPLICABLE} BOOL;
		in_rZActualPos : REAL;
		in_rXActualPos : REAL;
		in_rLoadDeltaZ : REAL;
		in_xLoadRightReq : BOOL;
		in_xLoadLeftReq : BOOL;
		in_xUnloadRightReq : BOOL;
		in_xUnloadLeftReq : BOOL;
	END_VAR
	VAR_OUTPUT
		out_sStatus : {REDUND_UNREPLICABLE} UDT_Sequence;
		out_xForksLeftOrder : BOOL;
		out_xForksRightOrder : BOOL;
		out_rXSetPoint : REAL;
		out_rZSetPoint : REAL;
		out_xLoaded : BOOL;
	END_VAR
	VAR
		OperateRight : BOOL;
		OperateLeft : BOOL;
		Unload : BOOL;
		Load : BOOL;
		v_InPosition : BOOL;
		v_LoadSequence : DINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Crane (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		in_rXSetPointReq : REAL;
		in_rZSetPointReq : REAL;
		in_rZActualPos : REAL;
		in_rXActualPos : REAL;
		in_xInterlock : BOOL;
	END_VAR
	VAR_OUTPUT
		out_sStatus : {REDUND_UNREPLICABLE} UDT_Sequence;
		out_rXSetPoint : REAL;
		out_rZSetPoint : REAL;
	END_VAR
	VAR
		InPosition : BOOL;
		Interlock : BOOL;
		NewRequest : BOOL;
		PreviousXSetPoint : REAL;
		PreviousZSetPoint : REAL;
		FirstScan : BOOL;
	END_VAR
END_FUNCTION_BLOCK

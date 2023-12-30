/* Automation Studio generated header file */
/* Do not edit ! */
/* Library  */

#ifndef _LIBRARY_
#define _LIBRARY_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum TSystemState
{	Initializing,
	Running,
	Error,
	Maintenance,
	SafetyStop
} TSystemState;

typedef struct UDT_StorageControllerInput
{	plcbit Opc_IO_Factory_Reset;
	plcbit Opc_IO_Factory_Running;
	plcbit Opc_IO_Factory_Paused;
} UDT_StorageControllerInput;

typedef struct UDT_ControlSystemInput
{	plcbit Opc_IO_StartButton;
	plcbit Opc_IO_StopButton;
	plcbit Opc_IO_ManualSwitch;
	plcbit Opc_IO_AutoSwitch;
} UDT_ControlSystemInput;

typedef struct UDT_ConveyorInfeedInput
{	plcbit Opc_IO_AtEntry;
	plcbit Opc_IO_AtLoad;
} UDT_ConveyorInfeedInput;

typedef struct UDT_ConveyorOutfeedInput
{	plcbit Opc_IO_AtExit;
	plcbit Opc_IO_AtUnload;
} UDT_ConveyorOutfeedInput;

typedef struct UDT_StorageRackSystemInput
{	plcbit Dummy;
} UDT_StorageRackSystemInput;

typedef struct UDT_PickAndPlaceSystemInput
{	float Opc_IO_PosZ;
	float Opc_IO_PosX;
	plcbit Opc_IO_MovingX;
	plcbit Opc_IO_MovingZ;
	plcbit Opc_IO_LeftLimitSwitch;
	plcbit Opc_IO_RightLimitSwitch;
	plcbit Opc_IO_MiddleLimitSwitch;
} UDT_PickAndPlaceSystemInput;

typedef struct UDT_SafetySystemInput
{	plcbit Opc_IO_EmergencyStop1;
} UDT_SafetySystemInput;

typedef struct UDT_HMIInput
{	plcbit Dummy;
} UDT_HMIInput;

typedef struct UDT_OpcInput
{	struct UDT_StorageControllerInput StorageController;
	struct UDT_ControlSystemInput ControlSystem;
	struct UDT_ConveyorInfeedInput ConveyorInfeed;
	struct UDT_ConveyorOutfeedInput ConveyorOutfeed;
	struct UDT_StorageRackSystemInput StorageRack;
	struct UDT_PickAndPlaceSystemInput PickAndPlace;
	struct UDT_SafetySystemInput Safety;
	struct UDT_HMIInput HMI;
} UDT_OpcInput;

typedef struct UDT_StorageControllerOutput
{	plcbit Dummy;
} UDT_StorageControllerOutput;

typedef struct UDT_ControlSystemOutput
{	plcbit Opc_IO_ResetLight;
	plcbit Opc_IO_StopLight;
	plcbit Opc_IO_StartLight;
} UDT_ControlSystemOutput;

typedef struct UDT_ConveyorInfeedOutput
{	plcbit Opc_IO_LoadingConveyor;
	plcbit Opc_IO_EntryConveyor;
} UDT_ConveyorInfeedOutput;

typedef struct UDT_ConveyorOutfeedOutput
{	plcbit Opc_IO_UnloadConveyor;
	plcbit Opc_IO_ExitConveyor;
} UDT_ConveyorOutfeedOutput;

typedef struct UDT_StorageRackSystemOutput
{	plcbit Dummy;
} UDT_StorageRackSystemOutput;

typedef struct UDT_PickAndPlaceSystemOutput
{	plcbit Opc_IO_ForksRight;
	float Opc_IO_XAxisSetPoint;
	float Opc_IO_ZAxisSetPoint;
	plcbit Opc_IO_ForksLeft;
} UDT_PickAndPlaceSystemOutput;

typedef struct UDT_SafetySystemOutput
{	plcbit Dummy;
} UDT_SafetySystemOutput;

typedef struct UDT_HMIOutput
{	plcbit Dummy;
} UDT_HMIOutput;

typedef struct UDT_OpcOutput
{	struct UDT_StorageControllerOutput StorageController;
	struct UDT_ControlSystemOutput ControlSystem;
	struct UDT_ConveyorInfeedOutput ConveyorInfeed;
	struct UDT_ConveyorOutfeedOutput ConveyorOutfeed;
	struct UDT_StorageRackSystemOutput StorageRack;
	struct UDT_PickAndPlaceSystemOutput PickAndPlace;
	struct UDT_SafetySystemOutput SafetySystem;
	struct UDT_HMIOutput HMI;
} UDT_OpcOutput;

typedef struct UDT_Opc
{	struct UDT_OpcInput In;
	struct UDT_OpcOutput Out;
} UDT_Opc;

typedef struct UDT_StorageController
{	plcbit Dummy;
} UDT_StorageController;

typedef struct UDT_ControlSystem
{	plcbit Dummy;
} UDT_ControlSystem;

typedef struct UDT_ConveyorInfeedSystem
{	plcbit ReadyForOffload;
} UDT_ConveyorInfeedSystem;

typedef struct UDT_ConveyorOutfeedSystem
{	plcbit ReadyForOnload;
} UDT_ConveyorOutfeedSystem;

typedef struct TCoordinate
{	float x;
	float z;
} TCoordinate;

typedef struct TBoxData
{	plcstring id[81];
	float weight;
	plcbit isvalid;
} TBoxData;

typedef struct TStorageSlot
{	signed short number;
	struct TCoordinate coordinate;
	plcbit available;
	struct TBoxData box;
} TStorageSlot;

typedef struct UDT_StorageRackSystem
{	plcbit Dummy;
	plcbit StoragePlaceRequest;
	struct TStorageSlot StoragePlaceAcknowledge;
} UDT_StorageRackSystem;

typedef struct UDT_HMI
{	plcbit Dummy;
} UDT_HMI;

typedef struct UDT_Sequence
{	plcbit Error;
	plcbit Idle;
	plcbit InProgress;
	plcbit Requested;
} UDT_Sequence;

typedef struct UDT_PickAndPlaceSystem
{	struct UDT_Sequence Offloading;
	struct UDT_Sequence Loading;
	float ActualPositionX;
	float ActualPositionZ;
} UDT_PickAndPlaceSystem;

typedef struct UDT_SafetySystem
{	plcbit SafetyStop;
	plcbit ControlledStop;
} UDT_SafetySystem;

typedef struct TParameters
{	signed short StorageSizeX;
	signed short StorageSizeZ;
	float FirstSlotXPos;
	float FirstSlotZPos;
	float LastSlotXPos;
	float LastSlotZPos;
} TParameters;

typedef struct UDT_Global
{	struct UDT_StorageController StorageController;
	struct UDT_ControlSystem ControlSystem;
	struct UDT_ConveyorInfeedSystem ConveyorIn;
	struct UDT_ConveyorOutfeedSystem ConveyorOut;
	struct UDT_StorageRackSystem StorageRackSystem;
	struct UDT_HMI HMI;
	struct UDT_PickAndPlaceSystem PickAndPlaceSystem;
	struct UDT_SafetySystem SafetySystem;
	struct TParameters Params;
} UDT_Global;

typedef struct UDT_Sequencer
{	plcbit OnEntryFlag;
	signed short CurrentStep;
	signed short NextStep;
} UDT_Sequencer;

typedef struct UDT_XYZCoordinate
{	float X;
	float Y;
	float Z;
} UDT_XYZCoordinate;

typedef struct FB_Loader
{
	/* VAR_INPUT (analog) */
	float in_rZActualPos;
	float in_rXActualPos;
	float in_rLoadDeltaZ;
	/* VAR_OUTPUT (analog) */
	struct UDT_Sequence out_sStatus;
	float out_rXSetPoint;
	float out_rZSetPoint;
	/* VAR (analog) */
	signed long v_LoadSequence;
	/* VAR_INPUT (digital) */
	plcbit in_xLimitRight;
	plcbit in_xLimitLeft;
	plcbit in_xLimitMiddle;
	plcbit in_xInterlock;
	plcbit in_xMovingX;
	plcbit in_xMovingZ;
	plcbit in_xLoadRightReq;
	plcbit in_xLoadLeftReq;
	plcbit in_xUnloadRightReq;
	plcbit in_xUnloadLeftReq;
	/* VAR_OUTPUT (digital) */
	plcbit out_xForksLeftOrder;
	plcbit out_xForksRightOrder;
	plcbit out_xLoaded;
	/* VAR (digital) */
	plcbit OperateRight;
	plcbit OperateLeft;
	plcbit Unload;
	plcbit Load;
	plcbit v_InPosition;
} FB_Loader_typ;

typedef struct FB_Crane
{
	/* VAR_INPUT (analog) */
	float in_rXSetPointReq;
	float in_rZSetPointReq;
	float in_rZActualPos;
	float in_rXActualPos;
	/* VAR_OUTPUT (analog) */
	struct UDT_Sequence out_sStatus;
	float out_rXSetPoint;
	float out_rZSetPoint;
	/* VAR (analog) */
	float PreviousXSetPoint;
	float PreviousZSetPoint;
	/* VAR_INPUT (digital) */
	plcbit in_xInterlock;
	/* VAR (digital) */
	plcbit InPosition;
	plcbit Interlock;
	plcbit NewRequest;
	plcbit FirstScan;
} FB_Crane_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void FB_Loader(struct FB_Loader* inst);
_BUR_PUBLIC void FB_Crane(struct FB_Crane* inst);


#ifdef __cplusplus
};
#endif
#endif /* _LIBRARY_ */


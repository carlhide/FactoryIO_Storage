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

typedef struct UDT_StorageRackSystem
{	plcbit Dummy;
} UDT_StorageRackSystem;

typedef struct UDT_HMI
{	plcbit Dummy;
} UDT_HMI;

typedef struct UDT_Sequence
{	plcbit Error;
	plcbit Idle;
	plcbit InProgess;
	plcbit Requested;
} UDT_Sequence;

typedef struct UDT_PickAndPlaceSystem
{	struct UDT_Sequence Offloading;
	struct UDT_Sequence Loading;
} UDT_PickAndPlaceSystem;

typedef struct UDT_SafetySystem
{	plcbit SafetyStop;
	plcbit ControlledStop;
} UDT_SafetySystem;

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

typedef struct UDT_Global
{	struct UDT_StorageController StorageController;
	struct UDT_ControlSystem ControlSystem;
	struct UDT_ConveyorInfeedSystem ConveyorIn;
	struct UDT_ConveyorOutfeedSystem ConveyorOut;
	struct UDT_StorageRackSystem StorageRackSystem;
	struct UDT_HMI HMI;
	struct UDT_PickAndPlaceSystem PickAndPlaceSystem;
	struct UDT_SafetySystem SafetySystem;
} UDT_Global;

typedef struct UDT_XYZCoordinate
{	float X;
	float Y;
	float Z;
} UDT_XYZCoordinate;

typedef struct fb_MoveCrane
{
	/* VAR_INPUT (analog) */
	float PosX;
	float PosY;
	/* VAR_OUTPUT (analog) */
	struct UDT_Sequence State;
	/* VAR_INPUT (digital) */
	plcbit Interlock;
	/* VAR_OUTPUT (digital) */
	plcbit ActuatorX;
	plcbit ActuatorY;
} fb_MoveCrane_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fb_MoveCrane(struct fb_MoveCrane* inst);
_BUR_PUBLIC UDT_XYZCoordinate f_GetCoordinate(plcbit RowNbr, plcbit TierNbr);


#ifdef __cplusplus
};
#endif
#endif /* _LIBRARY_ */


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
typedef struct UDT_StorageController
{
} UDT_StorageController;

typedef struct UDT_ControlSystem
{
} UDT_ControlSystem;

typedef struct UDT_ConveyorSystem
{
} UDT_ConveyorSystem;

typedef struct UDT_StorageRackSystem
{
} UDT_StorageRackSystem;

typedef struct UDT_HMI
{
} UDT_HMI;

typedef struct UDT_PickAndPlaceSystem
{
} UDT_PickAndPlaceSystem;

typedef struct New_Datatype
{
} New_Datatype;

typedef struct UDT_StorageControllerInput
{
} UDT_StorageControllerInput;

typedef struct UDT_ControlSystemInput
{
} UDT_ControlSystemInput;

typedef struct UDT_ConveyorInfeedInput
{	plcbit AtEntry;
	plcbit AtLoad;
} UDT_ConveyorInfeedInput;

typedef struct UDT_ConveyorOutfeedInput
{	plcbit AtExit;
	plcbit AtUnload;
} UDT_ConveyorOutfeedInput;

typedef struct UDT_StorageRackSystemInput
{
} UDT_StorageRackSystemInput;

typedef struct UDT_PickAndPlaceSystemInput
{
} UDT_PickAndPlaceSystemInput;

typedef struct UDT_SafetySystemInput
{
} UDT_SafetySystemInput;

typedef struct UDT_HMIInput
{
} UDT_HMIInput;

typedef struct UDT_OPCInput
{	struct UDT_StorageControllerInput StorageController;
	struct UDT_ControlSystemInput ControlSystem;
	struct UDT_ConveyorInfeedInput ConveyorInfeed;
	struct UDT_ConveyorOutfeedInput ConveyorOutfeed;
	struct UDT_StorageRackSystemInput StorageRack;
	struct UDT_PickAndPlaceSystemInput PickAndPlace;
	struct UDT_SafetySystemInput Safety;
	struct UDT_HMIInput HMI;
} UDT_OPCInput;

typedef struct UDT_StorageControllerOutput
{
} UDT_StorageControllerOutput;

typedef struct UDT_ControlSystemOutput
{
} UDT_ControlSystemOutput;

typedef struct UDT_ConveyorInfeedOutput
{
} UDT_ConveyorInfeedOutput;

typedef struct UDT_ConveyorOutfeedOutput
{
} UDT_ConveyorOutfeedOutput;

typedef struct UDT_StorageRackSystemOutput
{
} UDT_StorageRackSystemOutput;

typedef struct UDT_PickAndPlaceSystemOutput
{
} UDT_PickAndPlaceSystemOutput;

typedef struct UDT_SafetySystemOutput
{
} UDT_SafetySystemOutput;

typedef struct UDT_HMIOutput
{
} UDT_HMIOutput;

typedef struct UDT_OPCOutput
{	struct UDT_StorageControllerOutput StorageController;
	struct UDT_ControlSystemOutput ControlSystem;
	struct UDT_ConveyorInfeedOutput ConveyorInfeed;
	struct UDT_ConveyorOutfeedOutput ConveyorOutfeed;
	struct UDT_StorageRackSystemOutput StorageRack;
	struct UDT_PickAndPlaceSystemOutput PickAndPlace;
	struct UDT_SafetySystemOutput SafetySystem;
	struct UDT_HMIOutput HMI;
} UDT_OPCOutput;

typedef struct UDT_Opc
{	struct UDT_OPCInput In;
	struct UDT_OPCOutput Out;
} UDT_Opc;

typedef struct UDT_Global
{	struct UDT_StorageController StorageController;
	struct UDT_ControlSystem ControlSystem;
	struct UDT_ConveyorSystem ConveyorIn;
	struct UDT_ConveyorSystem ConveyorOut;
	struct UDT_StorageRackSystem StorageRackSystem;
	struct UDT_HMI HMI;
	struct UDT_PickAndPlaceSystem PickAndPlaceSystem;
	struct UDT_SafetySystem SafetySystem;
} UDT_Global;






#ifdef __cplusplus
};
#endif
#endif /* _LIBRARY_ */


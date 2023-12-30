#include <bur/plctypes.h>
#include <cmath>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>

#endif

unsigned long bur_heap_size = 0xFFFF; // Define heap size for dynamic memory allocation

// Define a struct to represent coordinates
struct Coordinates {
	int x;
	int z;
};

class RisingEdge {
	private:
	bool lastState; // Variable to keep track of the last state of the signal

	public:
	// Constructor
	RisingEdge() : lastState(false) {} // Initialize lastState to false

	// Function to check for a rising edge
	bool detect(bool currentState) {
		bool isRisingEdge = !lastState && currentState; // Check if the last state was false and current state is true
		lastState = currentState; // Update the last state to the current state
		return isRisingEdge; // Return true if a rising edge is detected, otherwise false
	}
};

class FallingEdge {
	private:
	bool lastState; // Variable to keep track of the last state of the signal

	public:
	// Constructor
	FallingEdge() : lastState(true) {} // Initialize lastState to true

	// Function to check for a falling edge
	bool detect(bool currentState) {
		bool isFallingEdge = lastState && !currentState; // Check if the last state was true and current state is false
		lastState = currentState; // Update the last state to the current state
		return isFallingEdge; // Return true if a falling edge is detected, otherwise false
	}
};


// Define a class to represent the storage rack
class StorageRack {
	public:
	static const int width = 9;
	static const int height = 6;
	TStorageSlot slots[width][height]; // true if available, false if occupied

	// Constructor to initialize all slots to available
	StorageRack() {
		for(int z = 0; z < height; ++z) {
			for(int x = 0; x < width; ++x) {
				float x_coordinate = 1.071*x + 1.435;
				float z_coordinate = 1.700*z + 0.550;
				TCoordinate coordinate = {x_coordinate, z_coordinate};
				TBoxData boxData = {-1, 10.23, false};
				TStorageSlot slot;
				slot.number = x*z; // example slot number
				slot.coordinate = coordinate;
				slot.available = true; // or false depending on context
				slot.box = boxData;
				slots[x][z] = slot;
				
			}
		}
	}

	

	// Function to find the closest available slot to a given position
	TStorageSlot& findClosestAvailable(float inputX, float inputZ) {
		float minDistance = width * height; // Initialize with maximum possible distance
		int closestX = width;
		int closestZ = height;
		for(int z = 0; z < height; ++z) {
			for(int x = 0; x < width; ++x) {
				if(slots[x][z].available) { // Slot is available
					float deltaX = (inputX - slots[x][z].coordinate.x);
					float deltaZ = (inputZ - slots[x][z].coordinate.z);
					if(deltaX < 0){deltaX = deltaX*-1;}
					if(deltaZ < 0){deltaX = deltaZ*-1;}
					float sumOfSquares = deltaX * deltaX + deltaZ * deltaZ;

					// Calculate the square root of the sum
					float distance = sqrt(sumOfSquares);
					distance = deltaX + deltaZ; // Calculate Manhattan distance
					if(distance < minDistance) {
						closestX = x;
						closestZ = z;
						minDistance = distance;
					}
				}
			}
		}
		return slots[closestX][closestZ]; // Return the coordinates of the closest slot
	}

	int numberOfAvailableSlot(){
		int available = 0;
		for(int z = 0; z < height; ++z) {
			for(int x = 0; x < width; ++x) {
				if(slots[x][z].available) {
					available++;
				}
			}
		}
		return available;
	}
	
	void updateStorageSlot(TStorageSlot slot){
		for(int z = 0; z < height; ++z) {
			for(int x = 0; x < width; ++x) {
				if(slots[x][z].number == slot.number) {
					slots[x][z] = slot;
				}
			}
		}	
	}

};

StorageRack myRack; // Instantiate the storage rack
RisingEdge risingEdgeStoragePlaceReq;
FallingEdge fallingEdgeStoragePlaceReq;
TStorageSlot requestedStorageSpace;


bool firstScan = true;
void _CYCLIC ProgramCyclic(void)
{

	if(risingEdgeStoragePlaceReq.detect(Gv.StorageRackSystem.StoragePlaceRequest)) {
		float ppsXPos = Gv.PickAndPlaceSystem.ActualPositionX;
		float ppsZPos = Gv.PickAndPlaceSystem.ActualPositionZ;
		//requestedStorageSpace = myRack.findClosestAvailable(ppsXPos, ppsZPos);
		//Gv.StorageRackSystem.StoragePlaceAcknowledge = requestedStorageSpace;
		Gv.StorageRackSystem.StoragePlaceAcknowledge = myRack.findClosestAvailable(ppsXPos, ppsZPos);;
		
	}
	
	if(fallingEdgeStoragePlaceReq.detect(Gv.StorageRackSystem.StoragePlaceRequest)) {
		myRack.updateStorageSlot(Gv.StorageRackSystem.StoragePlaceAcknowledge);
	}
}


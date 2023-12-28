#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

unsigned long bur_heap_size = 0xFFFF; // Define heap size for dynamic memory allocation

// Define a class to represent the storage rack
class StorageRack {
	public:
	static const int width = 9;
	static const int height = 6;
	bool slots[height][width]; // true if available, false if occupied

	// Constructor to initialize all slots to available
	StorageRack() {
		for(int i = 0; i < height; ++i) {
			for(int j = 0; j < width; ++j) {
				slots[i][j] = true;
			}
		}
	}

	// Function to find the next available slot
	// Returns false if no available slots
	bool findNextAvailable(int &x, int &y) {
		for(int i = 0; i < height; ++i) {
			for(int j = 0; j < width; ++j) {
				if(slots[i][j]) {
					x = j;
					y = i;
					return true;
				}
			}
		}
		return false; // No available slots
	}

	// Function to update a slot's status
	void updateSlot(int x, int y, bool available) {
		if(x >= 0 && x < width && y >= 0 && y < height) {
			slots[y][x] = available;
		}
	}
};

StorageRack myRack; // Instantiate the storage rack

void _CYCLIC ProgramCyclic(void)
{
	// Use the StorageRack class to manage slots within the cyclic function
	int nextX, nextY;

	// Example usage: Find next available slot
	if(myRack.findNextAvailable(nextX, nextY)) {
		// Found an available slot at (nextX, nextY)
		// Do something with this information, like updating the slot to be occupied
		myRack.updateSlot(nextX, nextY, false);
	}
}


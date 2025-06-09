#include <iostream>
#include "Arrays/Sorting.h"

int main() {
    std::vector<int> array = {8,2,4,7,1,3,9,6,5,10};

    Arrays::Sorting::quickSort(array, 0, array.size() - 1);

    std::cout << "Sorted array via quick sort algorithm: " << std::endl;
    for (auto i : array) {
        std::cout << i << " ";
    }

    return 0;
}
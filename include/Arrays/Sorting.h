//
// Created by Andrii on 6/8/2025.
//

#ifndef SORTING_H
#define SORTING_H

#include <iostream>
#include <vector>

namespace Arrays {
    class Sorting {
    public:
        static std::vector<int> quickSort(const std::vector<int>& arr) {
            std::vector<int> result = arr;

            int i = -1;
            for (int j = 0; j < result.size(); j++) {
                if (result[j] < result[result.size() - 1]) {
                    ++i;

                    const int temp = result[i];
                    result[i] = result[j];
                    result[j] = temp;
                }

                if (j == result.size() - 1) {
                    ++i;

                    const int temp = result[i];
                    result[i] = result[result.size() - 1];
                    result[result.size() - 1] = temp;
                }
            }

            std::cout << "Array after swapping i and j values depending on pivot: " << std::endl;
            for (auto i : result)
                std::cout << i << " ";

            return result;
        }
    };
}

#endif //SORTING_H

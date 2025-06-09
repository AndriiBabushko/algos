#pragma once

#ifndef SORTING_H
#define SORTING_H

#include <vector>

namespace Arrays {
    class Sorting {
    public:
        // Time complexity: O(log(n)) due to recursion
        static void quickSort(std::vector<int>& arr, const size_t start, const size_t end) {
            if (end <= start) return;

            const size_t pivot = partition(arr, start, end);
            if (pivot > start) {
                quickSort(arr, start, pivot - 1);
            }
            if (pivot < end) {
                quickSort(arr, pivot + 1, end);
            }
        }

    private:
        static size_t partition(std::vector<int>& arr, const size_t start, const size_t end) {
            const int pivot = arr[end];
            size_t i = start;

            for (size_t j = start; j < end; ++j) {
                if (arr[j] < pivot) {
                    std::swap(arr[i++], arr[j]);
                }
            }

            std::swap(arr[i], arr[end]);

            return i;
        }
    };
}

#endif //SORTING_H

cmake_minimum_required(VERSION 3.31)
project(Algos)

set(CMAKE_CXX_STANDARD 20)

add_executable(Algos
        include/Arrays/Sorting.h
        include/Arrays/Searching.h
        include/Arrays/TwoPointers.h
        include/Arrays/SlidingWindow.h
        include/LinkedLists/Traversal.h
        include/LinkedLists/InsertionAndDeletion.h
        include/LinkedLists/Reversal.h
        include/LinkedLists/CycleDetection.h
        include/HashTables.h
        include/Trees/Traversal.h
        include/Trees/Searching.h
        include/Stacks.h
        include/Queues.h
        include/Heaps.h
        include/Graphs/Traversal.h
        include/Graphs/ShortestPath.h
        include/Graphs/CycleDetection.h
        include/Tries.h
        include/DisjointSet.h
        src/Arrays.cpp
        src/Graphs.cpp
        src/LInkedLists.cpp
        src/Trees.cpp
        src/DisjointSet.cpp
        src/HashTables.cpp
        src/Heaps.cpp
        src/Queues.cpp
        src/Stacks.cpp
        src/Tries.cpp)

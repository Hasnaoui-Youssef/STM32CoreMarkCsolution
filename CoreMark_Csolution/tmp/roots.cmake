# roots.cmake
set(CMSIS_PACK_ROOT "/home/youssef/.cache/arm/packs" CACHE PATH "CMSIS pack root")
cmake_path(ABSOLUTE_PATH CMSIS_PACK_ROOT NORMALIZE OUTPUT_VARIABLE CMSIS_PACK_ROOT)
set(CMSIS_COMPILER_ROOT "/home/youssef/Embedded/cmsis-toolbox-linux-amd64/etc" CACHE PATH "CMSIS compiler root")
cmake_path(ABSOLUTE_PATH CMSIS_COMPILER_ROOT NORMALIZE OUTPUT_VARIABLE CMSIS_COMPILER_ROOT)
set(SOLUTION_ROOT "/home/youssef/Embedded/emb_projects/CoreMark_Csolution" CACHE PATH "CMSIS solution root")
cmake_path(ABSOLUTE_PATH SOLUTION_ROOT NORMALIZE OUTPUT_VARIABLE SOLUTION_ROOT)

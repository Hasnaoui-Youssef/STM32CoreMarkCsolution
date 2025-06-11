# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/2"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/tmp"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/src/prep.Release+MyBoard-stamp"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/src"
  "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/src/prep.Release+MyBoard-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/src/prep.Release+MyBoard-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/youssef/Embedded/emb_projects/cmsis_toolbox_gen/tmp/prep.Release+MyBoard/src/prep.Release+MyBoard-stamp${cfgdir}") # cfgdir has leading slash
endif()

# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/1"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/tmp"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/src/coremark.Debug+F4_DISC-stamp"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/src"
  "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/src/coremark.Debug+F4_DISC-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/src/coremark.Debug+F4_DISC-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/youssef/Embedded/emb_projects/CoreMark_Csolution/tmp/coremark.Debug+F4_DISC/src/coremark.Debug+F4_DISC-stamp${cfgdir}") # cfgdir has leading slash
endif()

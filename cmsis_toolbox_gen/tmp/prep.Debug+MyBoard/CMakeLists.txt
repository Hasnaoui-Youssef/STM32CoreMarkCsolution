cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT prep.Debug+MyBoard)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/prep/MyBoard/Debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(BIN_FILE "prep.bin")
set(HEX_FILE "prep.hex")
set(LD_SCRIPT "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/STM32CubeIDE/STM32F407VGTX_FLASH.ld")
set(LD_SCRIPT_PP ${LD_SCRIPT})

# Processor Options
set(CPU Cortex-M4)
set(FPU SP_FPU)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C ASM)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".elf" OUTPUT_NAME "prep")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/MX_Device"
  >
  "${SOLUTION_ROOT}/RTE/_Debug_MyBoard"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include"
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    USE_HAL_DRIVER
    STM32F407xx
    STM32F407xx
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:${ASM_BYTE_ORDER}"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-std=gnu11"
    "SHELL:-masm-syntax-unified"
    "SHELL:-fomit-frame-pointer"
    "SHELL:-ffunction-sections"
    "SHELL:-fdata-sections"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "none" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "none" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_CubeMX
  Group_STM32_HAL_Driver
  ARM_CMSIS_CORE_6_1_0
  Keil_Device_CubeMX_1_0_0
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--specs=nano.specs"
  "SHELL:--specs=nosys.specs"
  "SHELL:-Wl,-print-memory-usage"
  "SHELL:-Wl,--gc-sections"
  "SHELL:-Wl,--no-warn-rwx-segments"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Bin Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2BIN})

# Hex Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2HEX})

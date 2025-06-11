# groups.cmake

# group CubeMX
add_library(Group_CubeMX OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/STM32CubeIDE/Application/Startup/startup_stm32f407vgtx.s"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/main.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/stm32f4xx_it.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/stm32f4xx_hal_msp.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/system_stm32f4xx.c"
)
target_include_directories(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CubeMX_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CubeMX_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CubeMX PUBLIC
  Group_CubeMX_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  STM32F407xx
  _RTE_
)
cbuild_set_defines(AS_GNU COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/STM32CubeIDE/Application/Startup/startup_stm32f407vgtx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# group STM32 HAL Driver
add_library(Group_STM32_HAL_Driver OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c"
)
target_include_directories(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_STM32_HAL_Driver PUBLIC
  Group_STM32_HAL_Driver_ABSTRACTIONS
)

# group CoreMark
add_library(Group_CoreMark OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_list_join.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_main.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_matrix.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_portme.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_state.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/core_util.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/ee_printf.c"
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/cvt.c"
)
target_include_directories(Group_CoreMark PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CoreMark PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CoreMark_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CoreMark_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CoreMark PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CoreMark PUBLIC
  Group_CoreMark_ABSTRACTIONS
)

# group SysCalls
add_library(Group_SysCalls OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/F4_DISC/STM32CubeMX/Src/syscalls.c"
)
target_include_directories(Group_SysCalls PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_SysCalls PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_SysCalls_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_SysCalls_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_SysCalls PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_SysCalls PUBLIC
  Group_SysCalls_ABSTRACTIONS
)

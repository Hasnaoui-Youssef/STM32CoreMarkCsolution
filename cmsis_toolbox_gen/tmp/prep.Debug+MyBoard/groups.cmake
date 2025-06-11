# groups.cmake

# group CubeMX
add_library(Group_CubeMX OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/STM32CubeIDE/Application/Startup/startup_stm32f407vgtx.s"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/main.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/usb_host.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/usbh_conf.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/usbh_platform.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/stm32f4xx_it.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/stm32f4xx_hal_msp.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Src/system_stm32f4xx.c"
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
set_source_files_properties("${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/STM32CubeIDE/Application/Startup/startup_stm32f407vgtx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# group STM32 HAL Driver
add_library(Group_STM32_HAL_Driver OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/MyBoard/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c"
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

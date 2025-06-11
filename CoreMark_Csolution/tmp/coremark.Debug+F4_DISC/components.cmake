# components.cmake

# component ARM::CMSIS:CORE@6.1.0
add_library(ARM_CMSIS_CORE_6_1_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include"
)
target_compile_definitions(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:CubeMX@1.0.0
add_library(Keil_Device_CubeMX_1_0_0 INTERFACE)
target_include_directories(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(Keil_Device_CubeMX_1_0_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

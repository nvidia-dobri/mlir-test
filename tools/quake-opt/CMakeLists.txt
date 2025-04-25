get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(extension_libs GLOBAL PROPERTY MLIR_EXTENSION_LIBS)

add_llvm_executable(quake-opt
  quake-opt.cpp
)

target_link_libraries(quake-opt
  PRIVATE
  ${dialect_libs}
  ${extension_libs}
  QuakeDialect
  MLIROptLib
)

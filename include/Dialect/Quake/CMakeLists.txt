set(LLVM_TARGET_DEFINITIONS QuakeDialect.td)
mlir_tablegen(QuakeDialect.h.inc -gen-dialect-decls)
mlir_tablegen(QuakeDialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(QuakeDialectIncGen)

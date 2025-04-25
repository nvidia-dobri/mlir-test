#ifndef QUAKE_DIALECT_TD
#define QUAKE_DIALECT_TD

include "mlir/IR/OpBase.td"

def Quake_Dialect : Dialect {
  let name = "quake";
  let summary = "A minimal dialect";
  let description = [{
    A minimal dialect for testing purposes.
  }];
  let cppNamespace = "::mlir::quake";
}

#endif // QUAKE_DIALECT_TD

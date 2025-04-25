#ifndef QUAKE_DIALECT_H
#define QUAKE_DIALECT_H

#include "mlir/IR/Dialect.h"

namespace mlir {
namespace quake {

class QuakeDialect : public Dialect {
public:
  explicit QuakeDialect(MLIRContext *context);
  static StringRef getDialectNamespace() { return "quake"; }
};

} // namespace quake
} // namespace mlir

#endif // QUAKE_DIALECT_H

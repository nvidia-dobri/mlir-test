#include "Dialect/Quake/QuakeDialect.h"

using namespace mlir;
using namespace mlir::quake;

QuakeDialect::QuakeDialect(MLIRContext *context)
    : Dialect(getDialectNamespace(), context, TypeID::get<QuakeDialect>()) {}

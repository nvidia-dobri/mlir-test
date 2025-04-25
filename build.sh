#!/usr/bin/env bash
set -e

# Build with MLIR 20
echo "Building with MLIR 20..."
mkdir -p build-mlir-20
cd build-mlir-20
cmake .. -GNinja -DMLIR_DIR=$MLIR_20_DIR
ninja
cd ..

# Build with MLIR 19
echo "Building with MLIR 19..."
mkdir -p build-mlir-19
cd build-mlir-19
cmake .. -GNinja -DMLIR_DIR=$MLIR_19_DIR
ninja
cd ..

echo "Build completed for both MLIR versions"

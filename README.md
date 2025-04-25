# MLIR Multi-Version Development Environment

This repository demonstrates how to test MLIR table definitions across multiple
versions of MLIR (19.x and 20.x). It includes a sample Quake dialect for quantum
computing operations.

## Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- [Direnv](https://direnv.net/) (optional, but recommended)
- Git

## Setup

1. Clone this repository:

   ```bash
   git clone https://github.com/nvidia-dobri/mlir-test.git
   cd mlir-test
   ```

1. Setup your environment:

   a. Allow direnv to setup the environment (if using direnv):

   ```bash
   direnv allow
   ```

   b. Enter the Nix development shell (if not using direnv):

   ```bash
   nix develop
   ```

   This will:

   - Download and build MLIR 19.1.7 (if not already built)
   - Download and build MLIR 20.1.3 (if not already built)
   - Set up environment variables for both MLIR versions

   **Note:** The initial build may take a significant amount of time (30+
   minutes) as it compiles LLVM/MLIR from source.

1. Build the project against both MLIR versions:

   ```bash
   ./build.sh
   ```

## Testing with Different MLIR Versions

The `build.sh` script builds the project against both MLIR 19.1.7 and 20.1.3.
The build artifacts are placed in:

- `build-mlir-19/`: Build with MLIR 19.1.7
- `build-mlir-20/`: Build with MLIR 20.1.3

You can run the `quake-opt` tool from either build directory:

```bash
# Run with MLIR 19.1.7
./build-mlir-19/tools/quake-opt/quake-opt --help

# Run with MLIR 20.1.3
./build-mlir-20/tools/quake-opt/quake-opt --help
```

{
  description = "MLIR multi-version development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # LLVM/MLIR version configurations
        llvm19Version = "19.1.7";
        llvm20Version = "20.1.3";

      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Development tools
            cmake
            ninja
            clang
            include-what-you-use
            python3
            python3Packages.pip

            # Pre-commit hooks
            pre-commit
          ];

          shellHook = ''
            echo "MLIR Development Environment"

            # Build MLIR versions if they don't exist
            if [ ! -d "$HOME/.cache/mlir-19" ]; then
              echo "Building MLIR 19 (this may take a while)..."
              mkdir -p $HOME/.cache/mlir-19
              cd $HOME/.cache/mlir-19

              # Clone LLVM
              if [ ! -d "llvm-project" ]; then
                git clone --depth 1 --branch llvmorg-${llvm19Version} https://github.com/llvm/llvm-project.git
              fi

              # Build MLIR
              mkdir -p build
              cd build
              cmake ../llvm-project/llvm -G Ninja \
                -DLLVM_ENABLE_PROJECTS=mlir \
                -DLLVM_BUILD_EXAMPLES=ON \
                -DLLVM_TARGETS_TO_BUILD=host \
                -DCMAKE_BUILD_TYPE=Release \
                -DLLVM_ENABLE_ASSERTIONS=ON \
                -DCMAKE_INSTALL_PREFIX=$HOME/.cache/mlir-19/install
              ninja
              ninja install
              cd ../../..
            fi

            if [ ! -d "$HOME/.cache/mlir-20" ]; then
              echo "Building MLIR 20 (this may take a while)..."
              mkdir -p $HOME/.cache/mlir-20
              cd $HOME/.cache/mlir-20

              # Clone LLVM
              if [ ! -d "llvm-project" ]; then
                git clone --depth 1 --branch llvmorg-${llvm20Version} https://github.com/llvm/llvm-project.git
              fi

              # Build MLIR
              mkdir -p build
              cd build
              cmake ../llvm-project/llvm -G Ninja \
                -DLLVM_ENABLE_PROJECTS=mlir \
                -DLLVM_BUILD_EXAMPLES=ON \
                -DLLVM_TARGETS_TO_BUILD=host \
                -DCMAKE_BUILD_TYPE=Release \
                -DLLVM_ENABLE_ASSERTIONS=ON \
                -DCMAKE_INSTALL_PREFIX=$HOME/.cache/mlir-20/install
              ninja
              ninja install
              cd ../../..
            fi

            # Setup environment variables
            export MLIR_19_DIR="$HOME/.cache/mlir-19/install/lib/cmake/mlir"
            export MLIR_20_DIR="$HOME/.cache/mlir-20/install/lib/cmake/mlir"

            echo "MLIR v19: $MLIR_19_DIR"
            echo "MLIR v20: $MLIR_20_DIR"
          '';
        };
      });
}

# Dev Container Configuration

This directory contains the development container configuration for the C++ Training project with C++23 support.

## Overview

The dev container provides a standardized, reproducible development environment using Docker and VS Code's Dev Containers extension. It includes a full C++23 build toolchain with clangd-20, CMake, Ninja, and ccache for optimized compilation.

## Prerequisites

- [Docker](https://docs.docker.com/install/) - for running containers
- [VS Code](https://code.visualstudio.com/) - with the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- Adequate disk space for container image

## Quick Start

1. Open the project in VS Code
2. Click the green remote icon in the bottom-left corner (or press `Ctrl+Shift+P`)
3. Select "Dev Containers: Reopen in Container"
4. Wait for the container to build and start
5. The build will be configured automatically via `postCreateCommand`

## What's Included

**Build System**:
- CMake 3.x
- Ninja build system
- clangd-20 with clang-tidy
- ccache for build caching

**Compiler**:
- GCC/G++ with C++23 support

**VS Code Extensions**:
- `llvm-vs-code-extensions.vscode-clangd` - Advanced C/C++ language support
- `ms-vscode.cmake-tools` - CMake integration and configuration
- `ms-vscode.cpptools` - Microsoft C/C++ tools
- `twxs.cmake` - CMake syntax highlighting
- `usernamehw.errorlens` - Inline error/warning display

**Configurations**:
- Clangd with background indexing and clang-tidy integration
- Format-on-save enabled with clangd formatter
- CMake auto-configuration on workspace open
- ccache mounted from host for persistent caching
- SYS_PTRACE capability for debugging

## Building and Running

Inside the container:

```bash
# Build the project (auto-configured)
cd build && ninja

# Run the executable
./CppTraining

# Clean and rebuild
rm -rf build
cmake -B build -G Ninja
ninja -C build
```

## Environment Features

**ccache Integration**: Build cache is mounted from your host machine (`~/.cache/ccache`) for persistent caching across sessions.

**Remote User**: Runs as non-root user `vscode` for security.

**Debugging**: Includes necessary Linux capabilities (`SYS_PTRACE`) for debugging support.

## Troubleshooting

**Container won't build**: Ensure Docker daemon is running and you have sufficient disk space (at least 2GB).

**Clangd not working**: Wait for the background indexing to complete. Check the "Clangd" output panel in VS Code.

**Build fails**: The postCreateCommand runs automatically. If it failed:
```bash
cmake -B build -G Ninja
ninja -C build
```

**Clear cache**: If you want to rebuild without cache:
```bash
rm -rf ~/.cache/ccache
rm -rf build
```

## Documentation

- [Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [CMake Documentation](https://cmake.org/cmake/help/latest/)
- [Ninja Build System](https://ninja-build.org/)
- [ccache Documentation](https://ccache.dev/)
- [Clangd Documentation](https://clangd.llvm.org/)

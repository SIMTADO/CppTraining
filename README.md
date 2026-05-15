# C++ Training Project

A comprehensive C++ training environment with modern tooling, dev containers, and best practices.

## Features

- **C++23 Support**: Modern C++ with latest language features
- **CMake Build System**: Portable and scalable build configuration
- **Ninja Build Generator**: Fast incremental builds
- **Clangd Integration**: Advanced code intelligence and diagnostics
- **Dev Container**: Reproducible development environment with Docker
- **ccache**: Accelerated compilation through caching
- **Clang-Tidy**: Static analysis for code quality

## Quick Start

### Local Development

```bash
# Configure the project
cmake -B build -G Ninja

# Build
cd build && ninja

# Run
./CppTraining
```

### Using Dev Container

1. Open the project in VS Code
2. Press `Ctrl+Shift+P` and select "Dev Containers: Reopen in Container"
3. The environment will be set up automatically

## Project Structure

```
CppTrainning/
├── .devcontainer/          # Dev container configuration
│   ├── Dockerfile          # Container image definition
│   ├── devcontainer.json   # Dev container settings
│   └── README.md           # Dev container documentation
├── .vscode/                # VS Code workspace settings
│   └── settings.json       # Editor and tool configurations
├── scripts/                # Utility scripts
├── sources/                # Source files
│   └── test.cpp            # Test implementation
├── .clangd                 # Clangd configuration
├── .gitignore              # Git ignore rules
├── CMakeLists.txt          # CMake configuration
├── compile_commands.json   # Compilation database
└── README.md               # This file
```

## Requirements

- **Local Development**:
  - CMake 3.10+
  - C++23 compatible compiler (GCC 13+, Clang 16+)
  - Ninja build system
  - clangd-20 (optional, for IDE support)

- **Dev Container**:
  - Docker
  - VS Code with Dev Containers extension

## Building

### Command Line

```bash
# Configure
cmake -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# Build
cmake --build build

# Run
./build/CppTraining
```

### VS Code

1. Install CMake Tools extension
2. Select "Ninja" as the default generator
3. Click "Configure" in the CMake panel
4. Build using the CMake panel or `Ctrl+Shift+B`

## Configuration

### CMake Options

- `CMAKE_EXPORT_COMPILE_COMMANDS=ON` - Generate `compile_commands.json` for clangd
- `CMAKE_CXX_COMPILER_LAUNCHER=ccache` - Use ccache for compilation caching
- `CMAKE_BUILD_TYPE=Debug|Release` - Build type selection

### VS Code Settings

Key settings are configured in `.vscode/settings.json`:
- Clangd with background indexing and clang-tidy
- Format-on-save with clangd formatter
- CMake auto-configuration
- Error lens for inline diagnostics

## Development Workflow

1. **Edit Code**: Make changes in the editor with real-time code intelligence
2. **Build**: Use `Ctrl+Shift+B` or CMake Tools to build
3. **Debug**: Use VS Code's integrated debugger (configured in dev container)
4. **Analyze**: Clang-tidy runs automatically with clangd

## Environment Variables

- `CMAKE_CXX_STANDARD=23` - C++ standard version
- `CMAKE_EXPORT_COMPILE_COMMANDS=ON` - For clangd support

## Troubleshooting

**Build Fails**: Ensure CMake and Ninja are installed:
```bash
cmake --version
ninja --version
```

**Clangd Not Working**: Generate compile commands:
```bash
cmake -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

**Container Issues**: See [.devcontainer/README.md](.devcontainer/README.md)

## Documentation

- [CMake Documentation](https://cmake.org/cmake/help/latest/)
- [Ninja Build System](https://ninja-build.org/)
- [Clangd Documentation](https://clangd.llvm.org/)
- [C++23 Standard](https://en.cppreference.com/)

## License

This project is part of the C++ training curriculum.

## Contributing

When adding new code:
1. Follow the coding style (enforced by clangd formatter)
2. Run clang-tidy analysis
3. Ensure all tests pass
4. Update documentation as needed

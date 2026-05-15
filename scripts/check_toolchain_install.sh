#!/usr/bin/sh

echo "=== Toolchain Ubuntu — Vérification ==="  
echo ""  

for tool in gcc g++ make ninja gdb cmake; do
    printf "%-10s : " "$tool"
    if command -v $tool &>/dev/null; then
        $tool --version 2>&1 | head -1
    else
        echo "NON INSTALLÉ ❌"
    fi
done

echo ""  
echo "=== Test de build CMake + Ninja ==="  

# Créer un projet temporaire
TMPDIR=$(mktemp -d)  
cat > "$TMPDIR/CMakeLists.txt" << 'EOF'  
cmake_minimum_required(VERSION 3.20)  
project(ToolchainTest LANGUAGES CXX)  
set(CMAKE_CXX_STANDARD 23)  
add_executable(test_build main.cpp)  
EOF  

cat > "$TMPDIR/main.cpp" << 'EOF'
#include <iostream>
int main() {
    std::cout << "Toolchain OK — CMake + Ninja + g++\n";
}
EOF

# Configurer et compiler
if cmake -S "$TMPDIR" -B "$TMPDIR/build" -G Ninja &>/dev/null && \
   cmake --build "$TMPDIR/build" &>/dev/null; then
    "$TMPDIR/build/test_build"
    echo "Build CMake + Ninja : OK ✅"
else
    echo "Build CMake + Ninja : ÉCHEC ❌"
fi

rm -rf "$TMPDIR"
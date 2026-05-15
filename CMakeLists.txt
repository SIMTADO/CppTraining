cmake_minimum_required(VERSION 3.10)
project(CppTraining)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add compiler flags for better warnings and optimizations
if(MSVC)
  add_compile_options(/W4)
else()
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Add source files
set(SOURCES
  sources/test.cpp
)

# Create executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Export compile commands for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Optional: Add include directories
# target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Optional: Link libraries
# target_link_libraries(${PROJECT_NAME} PRIVATE some_library)

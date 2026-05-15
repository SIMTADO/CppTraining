#include <cassert>
#include <cstdio>
#include <stdexcept>

// Simple test function
int add(int a, int b) { return a + b; }

int subtract(int a, int b) { return a - b; }

int multiply(int a, int b) { return a * b; }

int divide(int a, int b) {
  if (b == 0) {
    throw std::invalid_argument("Division by zero");
  }
  return a / b;
}

int main() {
  printf("Running basic arithmetic tests...\n\n");

  // Test addition
  assert(add(5, 3) == 8);
  printf("✓ Addition test passed\n");

  // Test subtraction
  assert(subtract(10, 4) == 6);
  printf("✓ Subtraction test passed\n");

  // Test multiplication
  assert(multiply(6, 7) == 42);
  printf("✓ Multiplication test passed\n");

  // Test division
  assert(divide(20, 4) == 5);
  printf("✓ Division test passed\n");

  // Test division by zero
  try {
    divide(10, 0);
    assert(false && "Division by zero should throw");
  } catch (const std::invalid_argument& e) {
    printf("✓ Division by zero test passed\n");
  }

  printf("\nAll tests passed!\n");
  return 0;
}

#!/usr/bin/env python3
"""
Example Python script for learning and development.
"""

def greet(name="World"):
    """Simple greeting function."""
    return f"Hello, {name}!"

def calculate_factorial(n):
    """Calculate factorial of a number."""
    if n <= 1:
        return 1
    return n * calculate_factorial(n - 1)

def main():
    """Main function."""
    print(greet("Python Developer"))
    print(f"Factorial of 5: {calculate_factorial(5)}")
    
    # Example list comprehension
    squares = [x**2 for x in range(1, 6)]
    print(f"Squares: {squares}")

if __name__ == "__main__":
    main()
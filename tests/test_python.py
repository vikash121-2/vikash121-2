"""
Simple test for Python functions.
"""

import sys
import os

# Add src/python to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src', 'python'))

try:
    from hello import greet, calculate_factorial
    
    def test_greet():
        """Test greeting function."""
        assert greet() == "Hello, World!"
        assert greet("Test") == "Hello, Test!"
        print("✅ greet() function tests passed")
    
    def test_factorial():
        """Test factorial function."""
        assert calculate_factorial(0) == 1
        assert calculate_factorial(1) == 1
        assert calculate_factorial(5) == 120
        print("✅ calculate_factorial() function tests passed")
    
    def main():
        """Run all tests."""
        print("🧪 Running Python tests...")
        try:
            test_greet()
            test_factorial()
            print("🎉 All tests passed!")
            return 0
        except AssertionError as e:
            print(f"❌ Test failed: {e}")
            return 1
        except Exception as e:
            print(f"❌ Error running tests: {e}")
            return 1
    
    if __name__ == "__main__":
        exit(main())

except ImportError as e:
    print(f"❌ Could not import test modules: {e}")
    print("💡 Make sure to run this from the project root directory")
    exit(1)
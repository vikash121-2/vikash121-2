#!/usr/bin/env python3
"""
Main Python script for development tasks and utilities.
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path


def run_command(command, description=""):
    """Run a shell command and return the result."""
    if description:
        print(f"🔧 {description}")
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ Success: {result.stdout.strip()}")
            return True
        else:
            print(f"❌ Error: {result.stderr.strip()}")
            return False
    except Exception as e:
        print(f"❌ Exception: {e}")
        return False


def setup_project():
    """Set up the development environment."""
    print("🚀 Setting up development environment...")
    
    # Create necessary directories
    directories = ["src/c", "src/python", "build", "tests", "docs"]
    for directory in directories:
        Path(directory).mkdir(parents=True, exist_ok=True)
        print(f"📁 Created directory: {directory}")
    
    # Create example files if they don't exist
    create_example_files()
    
    print("✅ Project setup completed!")


def create_example_files():
    """Create example source files."""
    # C example
    c_file = Path("src/c/main.c")
    if not c_file.exists():
        c_content = '''#include <stdio.h>

int main() {
    printf("Hello from C!\\n");
    printf("This is a simple C program.\\n");
    return 0;
}
'''
        c_file.write_text(c_content)
        print("📝 Created example C file: src/c/main.c")
    
    # Python example
    py_file = Path("src/python/hello.py")
    if not py_file.exists():
        py_content = '''#!/usr/bin/env python3
"""
Example Python script.
"""

def main():
    print("Hello from Python!")
    print("This is a simple Python program.")
    
    # Example of basic Python features
    numbers = [1, 2, 3, 4, 5]
    squares = [n**2 for n in numbers]
    print(f"Numbers: {numbers}")
    print(f"Squares: {squares}")


if __name__ == "__main__":
    main()
'''
        py_file.write_text(py_content)
        print("📝 Created example Python file: src/python/hello.py")


def clean_project():
    """Clean build artifacts and temporary files."""
    print("🧹 Cleaning project...")
    
    patterns_to_remove = [
        "build/",
        "dist/",
        "__pycache__/",
        "*.pyc",
        "*.pyo",
        "*.out",
        "*.exe",
        ".pytest_cache/"
    ]
    
    for pattern in patterns_to_remove:
        run_command(f"rm -rf {pattern}", f"Removing {pattern}")


def run_tests():
    """Run all tests."""
    print("🧪 Running tests...")
    
    # Check if pytest is available
    if run_command("python3 -c 'import pytest'", "Checking pytest availability"):
        run_command("python3 -m pytest tests/ -v", "Running Python tests")
    else:
        print("⚠️ pytest not available, skipping Python tests")
    
    # Run C tests if any
    test_files = list(Path("tests").glob("test_*.c"))
    if test_files:
        print("🔍 Found C test files, compiling and running...")
        for test_file in test_files:
            output_name = test_file.stem
            compile_cmd = f"gcc -o build/{output_name} {test_file}"
            if run_command(compile_cmd, f"Compiling {test_file.name}"):
                run_command(f"./build/{output_name}", f"Running {test_file.name}")


def show_project_info():
    """Show information about the project structure."""
    print("📊 Project Information")
    print("=" * 50)
    
    # Show directory structure
    print("\n📂 Directory structure:")
    for root, dirs, files in os.walk("."):
        level = root.replace(".", "").count(os.sep)
        indent = " " * 2 * level
        print(f"{indent}{os.path.basename(root)}/")
        sub_indent = " " * 2 * (level + 1)
        for file in files[:5]:  # Limit to first 5 files
            print(f"{sub_indent}{file}")
        if len(files) > 5:
            print(f"{sub_indent}... and {len(files) - 5} more files")
    
    # Show available commands
    print("\n🛠️ Available commands:")
    print("  python3 scripts/main.py setup    - Set up the development environment")
    print("  python3 scripts/main.py clean    - Clean build artifacts")
    print("  python3 scripts/main.py test     - Run all tests")
    print("  python3 scripts/main.py info     - Show this information")
    print("  make build                       - Compile C programs")
    print("  make run                         - Compile and run C programs")
    print("  npm run help                     - Show npm script help")


def main():
    """Main function."""
    parser = argparse.ArgumentParser(description="Development utility script")
    parser.add_argument("command", nargs="?", default="info", 
                       choices=["setup", "clean", "test", "info"],
                       help="Command to execute")
    
    args = parser.parse_args()
    
    if args.command == "setup":
        setup_project()
    elif args.command == "clean":
        clean_project()
    elif args.command == "test":
        run_tests()
    elif args.command == "info":
        show_project_info()
    else:
        print("❌ Unknown command. Use --help for available commands.")
        sys.exit(1)


if __name__ == "__main__":
    main()
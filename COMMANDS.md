# vikash121-2 Development Environment

A comprehensive development environment setup for learning C and Python programming.

## 🚀 Quick Start

```bash
# Set up the development environment
npm run setup
# OR
./scripts/setup.sh

# Show all available commands
npm run help
```

## 📦 Available Commands

### NPM Scripts
- `npm run setup` - Set up development environment
- `npm run dev` - Start development environment
- `npm run clean` - Clean build artifacts
- `npm run build-c` - Build C programs
- `npm run run-c` - Build and run C programs
- `npm run test-python` - Run Python tests
- `npm run run-python` - Run Python scripts
- `npm run help` - Show detailed help

### Make Commands
- `make build` - Compile C programs
- `make run` - Compile and run C programs
- `make clean` - Clean build files
- `make init` - Create example C files

### Python Scripts
- `python3 scripts/main.py setup` - Set up project structure
- `python3 scripts/main.py clean` - Clean project files
- `python3 scripts/main.py test` - Run all tests
- `python3 scripts/main.py info` - Show project information

## 📁 Project Structure

```
├── src/
│   ├── c/          # C source files
│   └── python/     # Python source files
├── scripts/        # Development scripts
├── tests/          # Test files
├── build/          # Build artifacts (generated)
├── docs/           # Documentation
├── package.json    # NPM configuration
└── Makefile        # C build configuration
```

## 🛠️ Development Workflow

### For C Programming
1. Write your C code in `src/c/`
2. Use `make build` to compile
3. Use `make run` to compile and execute
4. Use `make clean` to clean build files

### For Python Programming
1. Write your Python code in `src/python/`
2. Use `npm run run-python` to execute
3. Use `npm run test-python` to run tests
4. Use `npm run lint-python` to check code style

## 🧪 Testing

- Python tests are in the `tests/` directory
- Run tests with `npm run test-python` or `python3 scripts/main.py test`
- C tests can be added to the `tests/` directory

## 🎯 Learning Goals

This environment is set up for learning:
- **C Programming**: Compilation, debugging, and best practices
- **Python Programming**: Scripting, testing, and code quality
- **Development Tools**: Make, npm, testing frameworks
- **Project Organization**: Clean structure and workflow

## 💡 Tips

- All commands should be run from the project root directory
- Use `npm run clean` regularly to clean up build artifacts
- Check `npm run help` for the most up-to-date command list
- The setup script will check for required dependencies

## 🔧 Requirements

- **Node.js** (for npm scripts)
- **Python 3** (for Python development)
- **GCC** (for C compilation)
- **Make** (for build automation)

Happy coding! 🎉
#!/bin/bash

# Development setup script
# This script sets up the development environment

set -e  # Exit on any error

echo "🚀 Setting up development environment for vikash121-2 repository..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if required tools are installed
check_dependencies() {
    print_status "Checking dependencies..."
    
    # Check for Node.js
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_success "Node.js found: $NODE_VERSION"
    else
        print_warning "Node.js not found. Some npm commands may not work."
    fi
    
    # Check for Python
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version)
        print_success "Python found: $PYTHON_VERSION"
    else
        print_error "Python3 not found. Please install Python3."
        exit 1
    fi
    
    # Check for GCC
    if command -v gcc &> /dev/null; then
        GCC_VERSION=$(gcc --version | head -n1)
        print_success "GCC found: $GCC_VERSION"
    else
        print_warning "GCC not found. C compilation will not work."
    fi
    
    # Check for Make
    if command -v make &> /dev/null; then
        MAKE_VERSION=$(make --version | head -n1)
        print_success "Make found: $MAKE_VERSION"
    else
        print_warning "Make not found. Makefile commands will not work."
    fi
}

# Create directory structure
create_directories() {
    print_status "Creating directory structure..."
    
    directories=(
        "src/c"
        "src/python"
        "build"
        "tests"
        "docs"
        "scripts"
    )
    
    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            print_success "Created directory: $dir"
        else
            print_status "Directory already exists: $dir"
        fi
    done
}

# Set up Python virtual environment (optional)
setup_python_env() {
    print_status "Setting up Python environment..."
    
    if [ ! -d "venv" ]; then
        if command -v python3 &> /dev/null; then
            python3 -m venv venv
            print_success "Created Python virtual environment"
            print_status "To activate: source venv/bin/activate"
        else
            print_warning "Python3 not found, skipping virtual environment setup"
        fi
    else
        print_status "Python virtual environment already exists"
    fi
}

# Install npm dependencies
install_npm_deps() {
    if [ -f "package.json" ] && command -v npm &> /dev/null; then
        print_status "Installing npm dependencies..."
        npm install
        print_success "npm dependencies installed"
    else
        print_warning "package.json not found or npm not available"
    fi
}

# Make scripts executable
make_scripts_executable() {
    print_status "Making scripts executable..."
    
    if [ -d "scripts" ]; then
        chmod +x scripts/*.sh 2>/dev/null || true
        chmod +x scripts/*.py 2>/dev/null || true
        print_success "Scripts made executable"
    fi
}

# Create example files
create_example_files() {
    print_status "Creating example files..."
    
    # Run the Python setup script
    if [ -f "scripts/main.py" ]; then
        python3 scripts/main.py setup
    fi
}

# Show available commands
show_commands() {
    print_status "Available commands after setup:"
    echo ""
    echo "📦 NPM Commands:"
    echo "  npm run dev       - Start development environment"
    echo "  npm run clean     - Clean build artifacts"
    echo "  npm run help      - Show help information"
    echo ""
    echo "🔨 Make Commands:"
    echo "  make build        - Compile C programs"
    echo "  make run          - Compile and run C programs"
    echo "  make clean        - Clean C build files"
    echo "  make help         - Show Make help"
    echo ""
    echo "🐍 Python Commands:"
    echo "  python3 scripts/main.py setup  - Set up project"
    echo "  python3 scripts/main.py clean  - Clean project"
    echo "  python3 scripts/main.py test   - Run tests"
    echo "  python3 scripts/main.py info   - Show project info"
    echo ""
    echo "🚀 Setup Commands:"
    echo "  ./scripts/setup.sh              - Run this setup script"
    echo ""
}

# Main setup process
main() {
    echo "----------------------------------------"
    echo "🎯 Development Environment Setup"
    echo "----------------------------------------"
    
    check_dependencies
    create_directories
    setup_python_env
    install_npm_deps
    make_scripts_executable
    create_example_files
    
    echo ""
    echo "----------------------------------------"
    print_success "Setup completed successfully! 🎉"
    echo "----------------------------------------"
    
    show_commands
}

# Run main function
main
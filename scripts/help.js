#!/usr/bin/env node

/**
 * Help script to display available commands and usage information
 */

const fs = require('fs');
const path = require('path');

// ANSI color codes
const colors = {
    reset: '\x1b[0m',
    bright: '\x1b[1m',
    red: '\x1b[31m',
    green: '\x1b[32m',
    yellow: '\x1b[33m',
    blue: '\x1b[34m',
    magenta: '\x1b[35m',
    cyan: '\x1b[36m',
    white: '\x1b[37m'
};

function colorize(text, color) {
    return `${colors[color]}${text}${colors.reset}`;
}

function printHeader(title) {
    console.log(colorize(`\n${'='.repeat(60)}`, 'cyan'));
    console.log(colorize(`  ${title}`, 'bright'));
    console.log(colorize(`${'='.repeat(60)}`, 'cyan'));
}

function printSection(title, items) {
    console.log(colorize(`\n📋 ${title}`, 'yellow'));
    console.log(colorize('-'.repeat(40), 'yellow'));
    
    items.forEach(item => {
        if (typeof item === 'string') {
            console.log(`  ${item}`);
        } else {
            const command = colorize(item.command, 'green');
            const description = item.description;
            console.log(`  ${command.padEnd(30)} - ${description}`);
        }
    });
}

function getPackageInfo() {
    try {
        const packagePath = path.join(process.cwd(), 'package.json');
        if (fs.existsSync(packagePath)) {
            const packageData = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
            return packageData;
        }
    } catch (error) {
        // Ignore errors
    }
    return null;
}

function main() {
    const packageInfo = getPackageInfo();
    
    printHeader('🛠️  Development Environment Help');
    
    if (packageInfo) {
        console.log(colorize(`\nProject: ${packageInfo.name}`, 'bright'));
        console.log(colorize(`Version: ${packageInfo.version}`, 'bright'));
        console.log(colorize(`Description: ${packageInfo.description}`, 'bright'));
    }
    
    // NPM Scripts
    const npmCommands = [
        { command: 'npm run setup', description: 'Set up development environment' },
        { command: 'npm run dev', description: 'Start development environment' },
        { command: 'npm run clean', description: 'Clean build artifacts and temporary files' },
        { command: 'npm run build-c', description: 'Build C programs using Make' },
        { command: 'npm run run-c', description: 'Build and run C programs' },
        { command: 'npm run clean-c', description: 'Clean C build files' },
        { command: 'npm run test-python', description: 'Run Python tests with pytest' },
        { command: 'npm run run-python', description: 'Run Python main script' },
        { command: 'npm run lint-python', description: 'Lint Python code with flake8' },
        { command: 'npm run format-python', description: 'Format Python code with black' },
        { command: 'npm run help', description: 'Show this help information' }
    ];
    
    printSection('NPM Scripts', npmCommands);
    
    // Make Commands
    const makeCommands = [
        { command: 'make build', description: 'Compile C programs' },
        { command: 'make run', description: 'Compile and run C programs' },
        { command: 'make clean', description: 'Remove build files' },
        { command: 'make init', description: 'Create example C source file' },
        { command: 'make help', description: 'Show Make help' },
        { command: 'make install', description: 'Show installation instructions' }
    ];
    
    printSection('Make Commands', makeCommands);
    
    // Python Scripts
    const pythonCommands = [
        { command: 'python3 scripts/main.py setup', description: 'Set up project structure' },
        { command: 'python3 scripts/main.py clean', description: 'Clean project files' },
        { command: 'python3 scripts/main.py test', description: 'Run all tests' },
        { command: 'python3 scripts/main.py info', description: 'Show project information' }
    ];
    
    printSection('Python Scripts', pythonCommands);
    
    // Shell Scripts
    const shellCommands = [
        { command: './scripts/setup.sh', description: 'Run complete environment setup' }
    ];
    
    printSection('Shell Scripts', shellCommands);
    
    // Directory Structure
    console.log(colorize('\n📁 Project Structure', 'yellow'));
    console.log(colorize('-'.repeat(40), 'yellow'));
    console.log('  src/c/          - C source files');
    console.log('  src/python/     - Python source files');
    console.log('  scripts/        - Development scripts');
    console.log('  tests/          - Test files');
    console.log('  build/          - Build artifacts');
    console.log('  docs/           - Documentation');
    
    // Getting Started
    console.log(colorize('\n🚀 Getting Started', 'yellow'));
    console.log(colorize('-'.repeat(40), 'yellow'));
    console.log('  1. Run: ' + colorize('npm run setup', 'green'));
    console.log('  2. Or: ' + colorize('./scripts/setup.sh', 'green'));
    console.log('  3. Start coding in src/c/ or src/python/');
    console.log('  4. Use make commands for C development');
    console.log('  5. Use npm scripts for Python development');
    
    // File Examples
    console.log(colorize('\n📝 Example Usage', 'yellow'));
    console.log(colorize('-'.repeat(40), 'yellow'));
    console.log('  • Create C program in src/c/main.c');
    console.log('  • Run: ' + colorize('make run', 'green') + ' to compile and execute');
    console.log('  • Create Python script in src/python/');
    console.log('  • Run: ' + colorize('npm run run-python', 'green') + ' to execute');
    
    console.log(colorize('\n💡 Tips', 'yellow'));
    console.log(colorize('-'.repeat(40), 'yellow'));
    console.log('  • Use ' + colorize('npm run clean', 'green') + ' to clean up build files');
    console.log('  • Check ' + colorize('python3 scripts/main.py info', 'green') + ' for project status');
    console.log('  • All scripts are designed to be run from the project root');
    
    console.log(colorize('\n✨ Happy coding! 🎉\n', 'bright'));
}

if (require.main === module) {
    main();
}

module.exports = { main };
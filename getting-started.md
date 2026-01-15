# Getting Started with MacroFlow

This guide will help you get up and running with MacroFlow in minutes.

## Installation

### macOS

```bash
# Add the tap
brew tap anishdpatel28/macroflow

# Install MacroFlow
brew install macroflow
```

### From Source

If you prefer to build from source:

```bash
# Clone the CLI repository
git clone https://github.com/anishdpatel28/MacroFlowCLI.git
cd MacroFlowCLI

# Build the binary
go build -o macro main.go

# Move to PATH
sudo mv macro /usr/local/bin/macro
```

## Your First Project

Let's create your first macro project!

### Step 1: Navigate to Your Project

```bash
cd ~/projects/my-app
```

### Step 2: Initialize MacroFlow

```bash
macro init
```

You should see:
```
✓ Created macro project 'my-app' at /Users/you/projects/my-app
  Project ID: abc-123-def-456

Next steps:
  - Add macros: macro add <name> <command>
  - List macros: macro list
```

### Step 3: Add Your First Macro

Let's add a simple macro:

```bash
macro add hello "echo 'Hello, MacroFlow!'"
```

### Step 4: Run Your Macro

```bash
macro hello
```

Output:
```
Executing: echo 'Hello, MacroFlow!'
Hello, MacroFlow!
```

Congratulations! You've created and run your first macro! 🎉

## Real-World Examples

### Web Development Project

```bash
cd ~/projects/my-website
macro init "My Website"

# Development macros
macro add dev "npm run dev"
macro add build "npm run build"
macro add test "npm test"
macro add lint "eslint . --fix"

# Git shortcuts
macro add save "git add . && git commit -m \"$@\" && git push"
macro add sync "git pull && npm install"

# Use them
macro dev                    # Start dev server
macro save Quick fix         # Commit and push
```

### Python Project

```bash
cd ~/projects/python-app
macro init

# Virtual environment
macro add activate "source venv/bin/activate"
macro add install "pip install -r requirements.txt"

# Running
macro add run "python main.py"
macro add test "pytest"

# Cleanup
macro add clean "find . -type d -name __pycache__ -exec rm -rf {} +"
```

### Docker Project

```bash
cd ~/projects/docker-app
macro init

macro add up "docker-compose up -d"
macro add down "docker-compose down"
macro add logs "docker-compose logs -f $1"
macro add shell "docker-compose exec $1 /bin/bash"

# Use them
macro up                     # Start containers
macro logs web              # Follow web container logs
macro shell api             # Shell into api container
```

## Understanding Directory Scoping

MacroFlow macros are scoped to directories. Here's what that means:

### Example 1: Single Project

```
~/projects/my-app/          ← macro init here
├── src/                    ← macros work here
│   └── components/         ← and here
└── tests/                  ← and here too
```

All macros work in `my-app` and ANY subdirectory.

### Example 2: Multiple Projects

```
~/projects/
├── app-a/                  ← Project A (macro init)
│   └── src/               ← Uses Project A macros
└── app-b/                 ← Project B (macro init)
    └── src/               ← Uses Project B macros
```

Each project has its own independent macros.

### Example 3: Nested Projects

```
~/projects/monorepo/        ← Project A (macro init)
├── frontend/              ← Uses Project A macros
└── backend/               ← Project B (macro init, overrides)
    └── api/               ← Uses Project B macros
```

The `backend` directory has its own project, so it (and its subdirectories) use Project B macros instead of Project A.

## Parameter Support

Macros can accept parameters for dynamic behavior.

### Positional Parameters

Use `$1`, `$2`, etc. for individual parameters:

```bash
macro add goto "cd $1"
macro add copy "cp $1 $2"

# Usage
macro goto src/components
macro copy file.txt backup.txt
```

### All Parameters

Use `$@` to capture all parameters:

```bash
macro add commit "git commit -m \"$@\""

# Usage
macro commit This is my commit message
# Runs: git commit -m "This is my commit message"
```

### Combining Parameters

```bash
macro add deploy "git add . && git commit -m \"$1\" && git push $2"

# Usage
macro deploy "Deploy v2.0" origin
# Runs: git add . && git commit -m "Deploy v2.0" && git push origin
```

## Managing Multiple Projects

### Viewing All Projects

```bash
macro list --projects
```

Output:
```
Macro Projects (3):
================================================================================

Frontend App
  Path: /Users/you/projects/frontend
  ID: abc-123
  Macros: 5
  Created: 2024-01-15 10:30:00

Backend API
  Path: /Users/you/projects/backend
  ID: def-456
  Macros: 8
  Created: 2024-01-15 11:00:00
```

### Viewing All Macros

```bash
macro list --all
```

This shows all macros grouped by project.

## Backup & Sharing

### Export Your Macros

Create a backup of all your macros:

```bash
macro export --file ~/backups/macros-backup.json
```

### Share with Team

Export and share with your team:

```bash
cd ~/projects/team-project
macro export --file macros.json

# Team member can import:
macro import --file macros.json --merge
```

### Import Macros

```bash
# Replace all existing data
macro import --file macros.json

# Merge with existing data (recommended)
macro import --file macros.json --merge
```

## Next Steps

Now that you understand the basics:

1. **Read the full [CLI README](https://github.com/anishdpatel28/MacroFlowCLI)** for detailed command reference
2. **Create macros for your daily workflows** - think about repetitive commands you run
3. **Explore parameter substitution** for more dynamic macros
4. **Export your macros** as a backup

## Getting Help

- Run `macro --help` to see all available commands
- Run `macro <command> --help` for help on a specific command
- Check the [CLI README](https://github.com/anishdpatel28/MacroFlowCLI) for detailed documentation

Happy macro-ing!

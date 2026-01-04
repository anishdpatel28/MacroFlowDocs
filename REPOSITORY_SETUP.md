# MacroFlowDocs Repository Setup

This is the documentation repository for MacroFlow.

## Repository Structure

MacroFlow consists of three separate repositories:

1. **MacroFlowCLI** - The command-line interface
2. **MacroFlowDocs** (This repository) - Documentation and examples
3. **MacroFlowGUI** (Coming soon) - GUI application

## Setting Up This Repository on GitHub

### 1. Create GitHub Repository

1. Go to GitHub and create a new repository named `MacroFlowDocs`
2. **Do NOT** initialize with README, .gitignore, or license (we already have these)
3. Keep it public (documentation should be accessible)

### 2. Initialize Git and Push

```bash
cd /Users/anish/Documents/GitHub/MacroFlow/MacroFlowDocs

# Initialize git
git init

# Add all files
git add .

# Make initial commit
git commit -m "Initial commit: MacroFlow Documentation"

# Add remote (replace 'anish' with your GitHub username)
git remote add origin https://github.com/anish/MacroFlowDocs.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Documentation Files

- **README.md** - Overview and links
- **getting-started.md** - Complete tutorial for new users
- **examples.md** - 50+ real-world macro examples

## Contributing

Contributions are welcome! To contribute:

1. Fork this repository
2. Create a branch for your changes
3. Make your changes (fix typos, add examples, improve clarity)
4. Submit a pull request

## Related Repositories

- [MacroFlowCLI](https://github.com/anish/MacroFlowCLI) - CLI application
- MacroFlowGUI (Coming soon) - GUI application

## License

Documentation is provided under MIT License (see LICENSE in MacroFlowCLI repository)

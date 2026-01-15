# MacroFlow Documentation

Official documentation for MacroFlow - a powerful CLI tool for directory-scoped command aliases.

## Documentation

- **[Getting Started](getting-started.md)** - Complete tutorial for new users
- **[Examples](examples.md)** - 50+ real-world macro examples

## Related Repositories

- **[MacroFlowCLI](https://github.com/<user>/MacroFlowCLI)** - The CLI application
- **MacroFlowGUI** (Coming soon) - GUI application

## What is MacroFlow?

MacroFlow is a command-line tool that allows developers to create directory-scoped command aliases (macros). Unlike global aliases, MacroFlow macros:

- Are tied to specific directories (projects)
- Work in that directory and all subdirectories
- Support parameters for dynamic behavior
- Can be easily imported/exported and shared with team members

## Quick Example

```bash
# Initialize a project
cd ~/projects/my-app
macro init

# Add macros
macro add dev "npm run dev"
macro add test "npm test"
macro add deploy "npm run build && firebase deploy"

# Use them
macro dev
```

## Contributing

Found a typo or want to add more examples? Contributions are welcome!

1. Fork this repository
2. Make your changes
3. Submit a pull request

## License

MIT License - See LICENSE file in the MacroFlowCLI repository.

## Links

- **CLI Repository**: [MacroFlowCLI](https://github.com/<user>/MacroFlowCLI)
- **Documentation**: You're here!
- **Issues**: Report issues in the [CLI repository](https://github.com/<user>/MacroFlowCLI/issues)

---

Built with ❤️ for developers who love efficiency

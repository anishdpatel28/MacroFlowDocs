# MacroFlow Examples

A collection of practical macro examples for various development workflows.

## Table of Contents

- [Web Development](#web-development)
- [Git Workflows](#git-workflows)
- [Docker & Containers](#docker--containers)
- [Python Development](#python-development)
- [Go Development](#go-development)
- [Database Management](#database-management)
- [System Administration](#system-administration)
- [File Operations](#file-operations)

## Web Development

### Node.js / JavaScript

```bash
# Basic development
macro add dev "npm run dev"
macro add build "npm run build"
macro add test "npm test"
macro add start "npm start"

# Package management
macro add install "npm install"
macro add add "npm install $@"
macro add remove "npm uninstall $@"
macro add clean "rm -rf node_modules package-lock.json && npm install"

# Linting and formatting
macro add lint "eslint . --fix"
macro add format "prettier --write ."
macro add check "npm run lint && npm test"

# Production
macro add prod "npm run build && npm run start:prod"
```

### React Development

```bash
# Component creation (with parameters)
macro add component "mkdir -p src/components/$1 && touch src/components/$1/$1.tsx src/components/$1/$1.module.css"

# Testing
macro add test:watch "npm test -- --watch"
macro add test:coverage "npm test -- --coverage"

# Storybook
macro add storybook "npm run storybook"
macro add build:storybook "npm run build-storybook"
```

### Next.js

```bash
macro add dev "next dev"
macro add build "next build"
macro add start "next start"
macro add analyze "ANALYZE=true next build"
macro add page "touch pages/$1.tsx"
```

## Git Workflows

### Basic Git Operations

```bash
# Status and info
macro add s "git status"
macro add log "git log --oneline --graph --decorate -n 10"
macro add diff "git diff"

# Committing
macro add add "git add $@"
macro add c "git commit -m \"$@\""
macro add amend "git commit --amend --no-edit"

# Push/Pull
macro add p "git push"
macro add pl "git pull"
macro add sync "git pull --rebase"
```

### Advanced Git Workflows

```bash
# Feature branch workflow
macro add feature "git checkout -b feature/$1"
macro add finish "git checkout main && git pull && git merge --no-ff $1"

# Quick save and push
macro add save "git add . && git commit -m \"$@\" && git push"

# Undo operations
macro add undo "git reset --soft HEAD~1"
macro add unstage "git reset HEAD $@"

# Branch management
macro add branches "git branch -a"
macro add cleanup "git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d"

# Stash operations
macro add stash "git stash save \"$@\""
macro add pop "git stash pop"
```

## Docker & Containers

### Docker Compose

```bash
# Basic operations
macro add up "docker-compose up -d"
macro add down "docker-compose down"
macro add restart "docker-compose restart $1"

# Logs
macro add logs "docker-compose logs -f"
macro add logs:web "docker-compose logs -f web"
macro add logs:api "docker-compose logs -f api"

# Shell access
macro add shell "docker-compose exec $1 /bin/bash"
macro add sh:web "docker-compose exec web /bin/bash"

# Rebuild
macro add rebuild "docker-compose down && docker-compose build && docker-compose up -d"
macro add fresh "docker-compose down -v && docker-compose up -d"
```

### Docker Commands

```bash
# Container management
macro add ps "docker ps"
macro add psa "docker ps -a"
macro add stop:all "docker stop \$(docker ps -q)"

# Cleanup
macro add clean:containers "docker container prune -f"
macro add clean:images "docker image prune -a -f"
macro add clean:all "docker system prune -a -f --volumes"

# Build and run
macro add build "docker build -t $1 ."
macro add run "docker run -it $@"
```

## Python Development

### Virtual Environments

```bash
# Environment setup
macro add venv "python -m venv venv"
macro add activate "source venv/bin/activate"
macro add install "pip install -r requirements.txt"
macro add freeze "pip freeze > requirements.txt"

# Development
macro add run "python main.py"
macro add debug "python -m pdb main.py"
```

### Testing and Quality

```bash
# Testing
macro add test "pytest"
macro add test:v "pytest -v"
macro add test:cov "pytest --cov=. --cov-report=html"
macro add test:watch "ptw"

# Linting
macro add lint "flake8 ."
macro add format "black ."
macro add type "mypy ."
macro add check "black . && flake8 . && mypy . && pytest"
```

### Django

```bash
# Server
macro add serve "python manage.py runserver"
macro add shell "python manage.py shell"

# Database
macro add migrate "python manage.py migrate"
macro add makemigrations "python manage.py makemigrations"
macro add dbshell "python manage.py dbshell"

# User management
macro add createsuperuser "python manage.py createsuperuser"

# Testing
macro add test "python manage.py test"
```

## Go Development

```bash
# Build and run
macro add run "go run ."
macro add build "go build -o bin/app"
macro add install "go install"

# Testing
macro add test "go test ./..."
macro add test:v "go test -v ./..."
macro add test:cov "go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out"
macro add bench "go test -bench=. ./..."

# Dependencies
macro add tidy "go mod tidy"
macro add vendor "go mod vendor"
macro add deps "go mod download"

# Linting
macro add lint "golangci-lint run"
macro add fmt "go fmt ./..."
macro add vet "go vet ./..."

# Cross-compilation
macro add build:linux "GOOS=linux GOARCH=amd64 go build -o bin/app-linux"
macro add build:windows "GOOS=windows GOARCH=amd64 go build -o bin/app-windows.exe"
macro add build:mac "GOOS=darwin GOARCH=amd64 go build -o bin/app-mac"
```

## Database Management

### PostgreSQL

```bash
# Connection
macro add psql "psql -U postgres -d $1"
macro add psql:local "psql -U postgres -d mydb -h localhost"

# Backup and restore
macro add backup "pg_dump -U postgres $1 > backup-\$(date +%Y%m%d-%H%M%S).sql"
macro add restore "psql -U postgres $1 < $2"

# Common queries
macro add tables "psql -U postgres -d $1 -c '\\dt'"
```

### MySQL

```bash
# Connection
macro add mysql "mysql -u root -p $1"

# Backup
macro add mysqldump "mysqldump -u root -p $1 > backup-\$(date +%Y%m%d-%H%M%S).sql"
```

### MongoDB

```bash
# Connection
macro add mongo "mongosh $1"

# Backup
macro add mongodump "mongodump --db=$1 --out=backup-\$(date +%Y%m%d-%H%M%S)"
macro add mongorestore "mongorestore --db=$1 $2"
```

## System Administration

### Server Management

```bash
# SSH connections
macro add ssh:prod "ssh user@production-server.com"
macro add ssh:staging "ssh user@staging-server.com"

# Process monitoring
macro add ports "lsof -i -P -n | grep LISTEN"
macro add procs "ps aux | grep $1"
macro add kill:port "lsof -ti:$1 | xargs kill -9"

# System info
macro add disk "df -h"
macro add mem "free -h"
macro add cpu "top -n 1"
```

### Logs

```bash
# View logs
macro add logs:nginx "tail -f /var/log/nginx/access.log"
macro add logs:error "tail -f /var/log/nginx/error.log"
macro add logs:app "tail -f /var/log/app/application.log"

# Search logs
macro add search:logs "grep -r \"$1\" /var/log/"
```

## File Operations

### Navigation

```bash
# Quick navigation
macro add src "cd src"
macro add tests "cd tests"
macro add docs "cd docs"
macro add back "cd .."
macro add root "cd \$(git rev-parse --show-toplevel)"
macro add home "cd ~"
```

### File Management

```bash
# Find files
macro add find "find . -name \"$1\""
macro add findtext "grep -r \"$1\" ."

# Compression
macro add zip "zip -r $1.zip $1"
macro add unzip "unzip $1"
macro add targz "tar -czf $1.tar.gz $1"
macro add untargz "tar -xzf $1"

# File operations
macro add backup "cp $1 $1.backup-\$(date +%Y%m%d-%H%M%S)"
macro add size "du -sh $1"
```

## Advanced Patterns

### Combining Multiple Commands

```bash
# Full deployment pipeline
macro add deploy "npm run test && npm run build && git push heroku main"

# Clean and reinstall
macro add fresh "rm -rf node_modules package-lock.json && npm install && npm run dev"

# Format, lint, test
macro add check:all "prettier --write . && eslint . --fix && npm test"
```

### Using Shell Features

```bash
# Environment-specific commands
macro add dev:local "NODE_ENV=development npm run dev"
macro add dev:prod "NODE_ENV=production npm run dev"

# Conditional execution
macro add test:changed "git diff --name-only | grep '\.test\.js$' | xargs npm test"

# Pipeline commands
macro add analyze "npm run build | gzip -c | wc -c"
```

### Project-Specific Workflows

```bash
# Monorepo operations
macro add build:all "npm run build --workspaces"
macro add test:all "npm test --workspaces"
macro add lint:all "npm run lint --workspaces"

# Mobile development
macro add ios "react-native run-ios"
macro add android "react-native run-android"
macro add pod:install "cd ios && pod install && cd .."
```

## Tips for Creating Great Macros

1. **Keep them simple**: One macro = one purpose
2. **Use descriptive names**: `dev` is better than `d`
3. **Add parameters for flexibility**: Use `$1`, `$2`, `$@`
4. **Document complex macros**: Use `macro list` to see them
5. **Group related macros**: Use prefixes like `test:`, `build:`, `docker:`
6. **Export and share**: Share useful macros with your team

## Contributing Examples

Have a useful macro? Please contribute by submitting a pull request!

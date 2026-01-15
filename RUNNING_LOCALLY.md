# Running Documentation Locally

Several ways to view MacroFlow documentation on localhost.

## Quickest Method (Recommended)

```bash
cd MacroFlowDocs

# Run the serve script
./serve.sh
```

Then open: **http://localhost:3000**

Features:
- ✅ Beautiful UI with syntax highlighting
- ✅ Search functionality
- ✅ Mobile-friendly
- ✅ No installation required (uses npx)

## Alternative Methods

### Method 1: Using npx directly

```bash
cd MacroFlowDocs
npx docsify-cli serve .
```

Open: http://localhost:3000

### Method 2: Install Docsify globally

```bash
# Install once
npm install -g docsify-cli

# Then run anytime
cd MacroFlowDocs
docsify serve .
```

Open: http://localhost:3000

### Method 3: Python Simple Server

```bash
cd MacroFlowDocs
python3 -m http.server 8000
```

Open: http://localhost:8000

⚠️ Note: This shows raw markdown files, not rendered HTML

### Method 4: Using Grip (GitHub-style)

```bash
# Install grip
pip install grip

# Serve specific file
cd MacroFlowDocs
grip README.md 8000
```

Open: http://localhost:8000

## Documentation Structure

```
MacroFlowDocs/
├── index.html          # Docsify configuration
├── _sidebar.md         # Navigation sidebar
├── .nojekyll          # GitHub Pages compatibility
├── serve.sh           # Quick start script
│
├── README.md           # Home page
├── getting-started.md  # Tutorial
├── examples.md         # Example macros
└── REPOSITORY_SETUP.md # Setup guide
```

## Customization

### Change Theme

Edit `index.html` and change the CSS theme:

```html
<!-- Available themes -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@4/lib/themes/vue.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@4/lib/themes/buble.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@4/lib/themes/dark.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@4/lib/themes/pure.css">
```

### Change Accent Color

Edit the CSS in `index.html`:

```css
:root {
  --theme-color: #4CAF50;  /* Change this color */
}
```

### Add More Plugins

Add to `index.html`:

```html
<!-- Emoji support -->
<script src="//cdn.jsdelivr.net/npm/docsify/lib/plugins/emoji.min.js"></script>

<!-- External links in new tab -->
<script src="//cdn.jsdelivr.net/npm/docsify/lib/plugins/external-script.min.js"></script>
```

## Deploy to GitHub Pages

Your docs are already configured for GitHub Pages!

1. Go to your repository settings on GitHub
2. Navigate to "Pages"
3. Select source: `main` branch, `/` (root)
4. Your docs will be live at: `https://anishdpatel28.github.io/MacroFlowDocs/`

## Troubleshooting

### Port already in use

```bash
# Use a different port
npx docsify-cli serve . -p 3001
```

### Can't find npx

```bash
# Install Node.js first
brew install node
```

### Script permission denied

```bash
chmod +x serve.sh
```

## Documentation Tips

- Edit markdown files and refresh browser to see changes
- No build step required
- Images go in an `images/` folder
- Code blocks support syntax highlighting

---

**Quick Start**: Run `./serve.sh` and open http://localhost:3000

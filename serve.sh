#!/bin/bash
# Simple script to serve MacroFlow documentation locally

echo "Starting MacroFlow Documentation Server..."
echo ""
echo "Documentation will be available at:"
echo "   http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Check if docsify is available globally
if command -v docsify &> /dev/null; then
    docsify serve .
# If not, use npx (no install needed)
else
    echo "Using npx to serve (no installation required)..."
    npx docsify-cli serve .
fi

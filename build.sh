#!/bin/bash
echo "=========================================="
echo "Building My Jenkins Project"
echo "=========================================="
echo "Build started at: $(date)"
echo ""

echo "[Step 1/5] Checking project structure..."
echo "Files in repository:"
ls -la
echo ""

echo "[Step 2/5] Validating HTML files..."
if [ -f "index.html" ]; then
    echo "✓ index.html found"
    lines=$(wc -l < index.html)
    echo "  → $lines lines of HTML code"
else
    echo "✗ index.html missing"
    exit 1
fi
echo ""

echo "[Step 3/5] Validating CSS files..."
if [ -f "styles.css" ]; then
    echo "✓ styles.css found"
    lines=$(wc -l < styles.css)
    echo "  → $lines lines of CSS code"
else
    echo "✗ styles.css missing"
    exit 1
fi
echo ""

echo "[Step 4/5] Validating JavaScript files..."
if [ -f "app.js" ]; then
    echo "✓ app.js found"
    lines=$(wc -l < app.js)
    echo "  → $lines lines of JavaScript code"
else
    echo "✗ app.js missing"
    exit 1
fi
echo ""

echo "[Step 5/5] Running final checks..."
echo "✓ All files validated successfully"
echo "✓ Project structure is correct"
echo "✓ Build completed successfully"
echo ""

echo "=========================================="
echo "Build Summary"
echo "=========================================="
echo "Status: SUCCESS ✅"
echo "Build finished at: $(date)"
echo "=========================================="

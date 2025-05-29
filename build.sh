#!/bin/bash

# Complete build script for mhtml-converter
# This script builds Go binaries and prepares the Python package
set -e

echo "🔨 Building Go binaries for all platforms..."
cd go-cli

# Create bin directory in Python package
mkdir -p ../mhtml_converter/bin

# Build for all major platforms
echo "Building for Linux amd64..."
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o ../mhtml_converter/bin/mhtml-to-html-linux-amd64 main.go

echo "Building for Linux arm64..."
GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -ldflags="-s -w" -o ../mhtml_converter/bin/mhtml-to-html-linux-arm64 main.go

echo "Building for macOS amd64..."
GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o ../mhtml_converter/bin/mhtml-to-html-darwin-amd64 main.go

echo "Building for macOS arm64..."
GOOS=darwin GOARCH=arm64 CGO_ENABLED=0 go build -ldflags="-s -w" -o ../mhtml_converter/bin/mhtml-to-html-darwin-arm64 main.go

echo "Building for Windows amd64..."
GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o ../mhtml_converter/bin/mhtml-to-html-windows-amd64.exe main.go

cd ..

echo "✅ Build completed! Binaries are in mhtml_converter/bin/"
ls -la mhtml_converter/bin/

echo ""
echo "🧪 Testing Python package..."
python3 -c "
import sys
from pathlib import Path
sys.path.insert(0, str(Path.cwd()))
from mhtml_converter.converter import _detect_binary
print('✅ Binary detection successful:', _detect_binary())
"

echo ""
echo "🎉 Ready for packaging with UV!"
echo ""
echo "Next steps:"
echo "  uv build          # Build wheel and sdist"
echo "  uv publish        # Publish to PyPI"
echo ""
echo "Or test locally:"
echo "  uv run python -c \"from mhtml_converter import convert_mhtml; print('OK')\"" 
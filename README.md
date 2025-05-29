# MHTML Converter

A Python package that converts MHTML files to HTML with automatic encoding detection, especially useful for Chinese, Japanese, and Korean content.

## Features

- 🌍 **Smart Encoding Detection**: Automatically detects and converts Chinese (GBK, GB18030), Japanese (Shift_JIS), Korean (EUC-KR) and other encodings
- ⚡ **Fast Performance**: Uses optimized Go binary under the hood
- 🖥️ **Cross-Platform**: Works on Linux, macOS, and Windows (x64 & ARM64)
- 🐍 **Simple Python API**: Clean interface with optional CLI
- 📦 **Zero Dependencies**: Self-contained with embedded binaries

## Installation

```bash
pip install mhtml-converter
```

## Quick Start

### Python API

```python
from mhtml_converter import convert_mhtml

# Convert MHTML to HTML string
html_content = convert_mhtml("document.mht")

# Save to file with verbose encoding detection
convert_mhtml("chinese_doc.mht", output_file="output.html", verbose=True)

# Convert with explicit encoding (if detection fails)
html_content = convert_mhtml("document.mht", encoding="gbk")
```

### Command Line

```bash
# Convert single file
mhtml-converter input.mht -o output.html

# Verbose mode to see encoding detection
mhtml-converter input.mht -o output.html --verbose

# Convert multiple files
mhtml-converter *.mht --output-dir converted/
```

## Why This Package?

Many MHTML files, especially those saved from Chinese, Japanese, or Korean websites, use non-UTF-8 encodings that cause garbled text when converted naively. This package:

1. **Detects encoding** from HTML meta tags and content analysis
2. **Converts properly** to UTF-8 for universal compatibility  
3. **Preserves formatting** and embedded resources
4. **Works reliably** across different platforms and languages

## Use Cases

- Converting saved web pages from Asian websites
- Processing email archives in MHTML format
- Batch conversion of documentation
- Web scraping pipeline preprocessing
- Digital preservation workflows

## Technical Details

This package wraps a high-performance Go binary that handles the actual conversion. The Python layer provides a clean API and handles platform detection automatically.

### Supported Platforms

| OS | Architecture | Status |
|---|---|---|
| Linux | x86_64 | ✅ |
| Linux | ARM64 | ✅ |
| macOS | Intel | ✅ |
| macOS | Apple Silicon | ✅ |
| Windows | x86_64 | ✅ |

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Contributing

Issues and pull requests welcome! This project wraps the excellent [gonejack/mhtml-to-html](https://github.com/gonejack/mhtml-to-html) Go tool with Python convenience layers. 
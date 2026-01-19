# TermTube

TermTube is a lightweight, terminal-based wrapper for `yt-dlp` that allows you to search for YouTube videos, select formats interactively, and download them with ease. It combines the power of `yt-dlp` with the interactivity of `fzf`.

## Features

- **Search**: Search YouTube directly from the terminal.
- **Interactive Selection**: Navigate search results using `fzf`.
- **Format Control**: Interactively choose video/audio quality and formats.
- **Dependency Check**: Automatically validates required tools.

## Prerequisites

TermTube relies on the following powerful tools:
- `yt-dlp`: For media extraction.
- `jq`: For JSON parsing.
- `fzf`: For the fuzzy finder interface.
- `ffmpeg`: For media merging and conversion.

## Installation

### Arch Linux (Recommended)

TermTube includes an automated installer script that detects Arch Linux and handles `pacman` operations.

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/termtube.git
   cd termtube
   ```

2. Run the installer:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

### Manual Installation

If you prefer manual setup or are using a different distro:

1. Install dependencies:
   ```bash
   # Arch
   sudo pacman -S yt-dlp jq fzf ffmpeg

   # Debian/Ubuntu
   sudo apt install yt-dlp jq fzf ffmpeg
   ```

2. Make the script executable and move it to your path:
   ```bash
   chmod +x termtube
   sudo ln -s "$(pwd)/termtube" /usr/local/bin/termtube
   ```

## Usage

Simply run `termtube` in your terminal:

```bash
termtube
```

1. Enter your search query when prompted.
2. Use the **Up/Down** arrows to navigate video results. Press **Enter** to select.
3. Use the **Up/Down** arrows to select your desired quality/format. Press **Enter** to select.
4. Choose your download directory (default is current).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

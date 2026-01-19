#!/bin/bash
# TermTube Installer

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Starting TermTube Installation...${NC}"

# Detect OS
OS="$(uname -s)"
DISTRO=""

if [ "$OS" == "Linux" ]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    fi
elif [ "$OS" == "Darwin" ]; then
    DISTRO="macos"
fi

echo -e "Detected OS: $OS ($DISTRO)"

install_dependencies() {
    echo -e "${BLUE}Installing dependencies...${NC}"
    case $DISTRO in
        arch|manjaro)
            echo "Detected Arch Linux/Manjaro."
            sudo pacman -Syu --noconfirm yt-dlp jq fzf ffmpeg nodejs npm mplayer
            ;;
        debian|ubuntu|kali|linuxmint)
            echo "Detected Debian/Ubuntu based system."
            sudo apt update
            sudo apt install -y yt-dlp jq fzf ffmpeg nodejs npm vlc
            ;;
        macos)
            echo "Detected macOS."
            if ! command -v brew &> /dev/null; then
                echo -e "${RED}Homebrew not found. Please install Homebrew first.${NC}"
                exit 1
            fi
            brew install yt-dlp jq fzf ffmpeg node vlc
            ;;
        *)
            echo -e "${RED}Unsupported distribution: $DISTRO${NC}"
            echo "Please install 'yt-dlp', 'jq', 'fzf', 'ffmpeg', 'nodejs' and 'vlc' manually."
            ;;
    esac
}

setup_executable() {
    echo -e "${BLUE}Setting up TermTube...${NC}"
    chmod +x termtube
    
    # Symlink
    TARGET_BIN="/usr/local/bin/termtube"
    if [ -L "$TARGET_BIN" ] || [ -f "$TARGET_BIN" ]; then
        echo "Removing existing installation..."
        sudo rm "$TARGET_BIN"
    fi

    echo "Creating symlink to $TARGET_BIN..."
    sudo ln -s "$(pwd)/termtube" "$TARGET_BIN"
}

# Main flow
install_dependencies
setup_executable

echo -e "${GREEN}Installation Complete!${NC}"
echo "You can now run 'termtube' from anywhere."

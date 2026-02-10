#!/bin/sh

# A.S.S. - Automated System Setup
# Pure shell implementation

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print help message
print_help() {
    cat << EOF
A.S.S. - Automated System Setup

USAGE:
    setup [OPTIONS]

OPTIONS:
    --help, -h           Show this help message

EXAMPLES:
    setup                       # Run the setup
EOF
}

# Parse command-line arguments
parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            --help|-h)
                print_help
                exit 0
                ;;
            *)
                echo "${RED}Unknown option: $1${NC}" >&2
                echo "Use --help for usage information" >&2
                exit 1
                ;;
        esac
        shift
    done
}

# Check for required dependencies
check_deps() {
    missing_deps=""
    
    # Check for git
    if ! command -v git >/dev/null 2>&1; then
        missing_deps="$missing_deps git"
    fi
    
    # Check for curl
    if ! command -v curl >/dev/null 2>&1; then
        missing_deps="$missing_deps curl"
    fi
    
    # Check for sudo
    if ! command -v sudo >/dev/null 2>&1; then
        echo "${RED}ERROR: sudo is required but not found${NC}" >&2
        exit 1
    fi
    
    # Check for systemctl
    if ! command -v systemctl >/dev/null 2>&1; then
        echo "${RED}ERROR: systemctl is required but not found (are you on systemd?)${NC}" >&2
        exit 1
    fi
    
    # Install missing dependencies
    if [ -n "$missing_deps" ]; then
        echo "Installing missing dependencies:$missing_deps"
        sudo pacman -S --noconfirm $missing_deps || {
            echo "${RED}Failed to install dependencies${NC}" >&2
            exit 1
        }
        echo "${GREEN}✓${NC} Dependencies installed successfully"
    fi
}

# Install paru (AUR helper)
install_paru() {
    echo "Installing paru..."
    
    # Check if paru is already installed
    if command -v paru >/dev/null 2>&1; then
        echo "${GREEN}✓${NC} Paru already installed, skipping installation"
        return
    fi
    
    # Clone paru repo
    git clone https://aur.archlinux.org/paru.git || {
        echo "${RED}Failed to clone paru repository${NC}" >&2
        exit 1
    }
    
    # Install dependencies
    sudo pacman -Syyu --noconfirm rustup bat devtools || {
        echo "${RED}Failed to install dependencies${NC}" >&2
        exit 1
    }
    
    # Setup rust stable
    rustup default stable || {
        echo "${RED}Failed to setup rust stable${NC}" >&2
        exit 1
    }
    
    # Build and install paru
    cd paru || exit 1
    makepkg -si --noconfirm || {
        echo "${RED}Failed to build/install paru${NC}" >&2
        exit 1
    }
    cd ..
    
    echo "${GREEN}✓${NC} Paru installed successfully!"
}

# Clone dotfiles and run install script
setup_dotfiles() {
    echo "Setting up dotfiles..."
    
    dotfiles_path="$HOME/.dotfiles"
    
    # Check if dotfiles already exists
    if [ -d "$dotfiles_path" ]; then
        echo "${GREEN}✓${NC} Dotfiles already cloned, skipping clone"
    else
        # Clone dotfiles repo with --depth=1
        cd "$HOME" || exit 1
        git clone --depth=1 https://github.com/jeebuscrossaint/dotfiles.git .dotfiles || {
            echo "${RED}Failed to clone dotfiles repository${NC}" >&2
            exit 1
        }
    fi
    
    # Run the install script
    cd "$dotfiles_path" || exit 1
    
    if [ -f "install.sh" ]; then
        chmod +x install.sh
        ./install.sh || {
            echo "${RED}Failed to run dotfiles install script${NC}" >&2
            exit 1
        }
    else
        echo "${YELLOW}⚠${NC} Warning: install.sh not found in dotfiles directory"
    fi
    
    echo "${GREEN}✓${NC} Dotfiles setup complete!"
}

# Setup Chaotic AUR repository
setup_chaotic_aur() {
    echo "Setting up Chaotic AUR..."
    
    # Check if Chaotic AUR is already configured
    if grep -q '\[chaotic-aur\]' /etc/pacman.conf; then
        echo "${GREEN}✓${NC} Chaotic AUR already configured, skipping setup"
        return
    fi
    
    # Receive GPG key
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com || {
        echo "${RED}Failed to receive Chaotic AUR GPG key${NC}" >&2
        exit 1
    }
    
    # Locally sign the key
    sudo pacman-key --lsign-key 3056513887B78AEB || {
        echo "${RED}Failed to sign Chaotic AUR GPG key${NC}" >&2
        exit 1
    }
    
    # Install chaotic-keyring
    sudo pacman -U --noconfirm https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst || {
        echo "${RED}Failed to install chaotic-keyring${NC}" >&2
        exit 1
    }
    
    # Install chaotic-mirrorlist
    sudo pacman -U --noconfirm https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst || {
        echo "${RED}Failed to install chaotic-mirrorlist${NC}" >&2
        exit 1
    }
    
    # Append to /etc/pacman.conf
    temp_conf="/tmp/chaotic-aur.conf"
    cat > "$temp_conf" << EOF

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
    
    sudo tee -a /etc/pacman.conf < "$temp_conf" >/dev/null || {
        echo "${RED}Failed to update pacman.conf${NC}" >&2
        exit 1
    }
    
    rm -f "$temp_conf"
    
    # Update system
    sudo pacman -Syu --noconfirm || {
        echo "${RED}Failed to update system${NC}" >&2
        exit 1
    }
    
    echo "${GREEN}✓${NC} Chaotic AUR setup complete!"
}

# Configure pacman.conf with performance optimizations
configure_pacman() {
    echo "Configuring pacman.conf..."
    
    temp_conf="/tmp/setup-pacman.conf"
    cp /etc/pacman.conf "$temp_conf"
    
    # Uncomment Color
    sed -i 's/^#Color$/Color/' "$temp_conf"
    
    # Comment out NoProgressBar
    sed -i 's/^NoProgressBar$/#NoProgressBar/' "$temp_conf"
    
    # Set ParallelDownloads = 25
    sed -i 's/^#*ParallelDownloads.*$/ParallelDownloads = 25/' "$temp_conf"
    
    # Add ILoveCandy if not present
    if ! grep -q '^ILoveCandy' "$temp_conf"; then
        # Add ILoveCandy after the [options] section
        sed -i '/^\[options\]/a ILoveCandy' "$temp_conf"
    fi
    
    # Copy to /etc/pacman.conf
    sudo cp "$temp_conf" /etc/pacman.conf || {
        echo "${RED}Failed to update /etc/pacman.conf${NC}" >&2
        exit 1
    }
    
    rm -f "$temp_conf"
    
    echo "${GREEN}✓${NC} Pacman.conf configured successfully!"
}

# Main function
main() {
    parse_args "$@"
    
    if [ $DRY_RUN -eq 1 ]; then
        echo "=== DRY RUN MODE ==="
        echo "No actual changes will be made"
        echo ""
    fi
    
    echo "A.S.S. - Arch Setup Script"
    echo ""
    
    check_deps
    configure_pacman
    install_paru
    setup_chaotic_aur
    setup_dotfiles
    
    echo ""
    echo "${GREEN}✓${NC} Setup complete! Your system is ready to use!"
}

# Run main function with all arguments
main "$@"

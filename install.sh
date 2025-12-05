#!/bin/bash

set -e  # Exit on error

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    error "This script is for macOS only"
    exit 1
fi


info "Starting setup ..."
. ./helpers.sh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    success "Homebrew installed"
else
    success "Homebrew already installed"
fi

# Install packages
info "Installing packages..."

packages=(
    "zsh"
    "tmux"
    "neovim"
    "git"
    "curl"
    "lazygit"
    "fd"
    "ripgrep"
)

for package in "${packages[@]}"; do
    if brew list "$package" &> /dev/null; then
        success "$package already installed"
    else
        info "Installing $package..."
        brew install "$package"
        success "$package installed"
    fi
done

# Install Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "Oh My Zsh installed"
else
    success "Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
    info "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    success "Powerlevel10k installed"
else
    success "Powerlevel10k already installed"
fi

# Install zsh plugins
plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# zsh-syntax-highlighting
if [[ ! -d "$plugins_dir/zsh-syntax-highlighting" ]]; then
    info "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $plugins_dir/zsh-syntax-highlighting
    success "zsh-syntax-highlighting installed"
else
    success "zsh-syntax-highlighting already installed"
fi

# zsh-autosuggestions
if [[ ! -d "$plugins_dir/zsh-autosuggestions" ]]; then
    info "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $plugins_dir/zsh-autosuggestions
    success "zsh-autosuggestions installed"
else
    success "zsh-autosuggestions already installed"
fi

# zsh-completions
if [[ ! -d "$plugins_dir/zsh-completions" ]]; then
    info "Installing zsh-completions..."
    git clone https://github.com/zsh-users/zsh-completions $plugins_dir/zsh-completions
    success "zsh-completions installed"
else
    success "zsh-completions already installed"
fi

# Create .config directory if it doesn't exist
if [[ ! -d "$HOME/.config" ]]; then
    info "Creating ~/.config directory..."
    mkdir -p "$HOME/.config"
    success "~/.config created"
fi

# Function to copy config
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
copy_config() {
    local source=$1
    local target=$2
    local description=$3

    info "Copying $description..."

    if [[ ! -e "$SCRIPT_DIR/$source" ]]; then
        error "Source not found: $SCRIPT_DIR/$source"
        return 1
    fi

    # Backup existing config if it exists
    backup_if_exists "$target"

    # Create parent directory if needed
    local target_dir=$(dirname "$target")
    if [[ ! -d "$target_dir" ]]; then
        mkdir -p "$target_dir"
    fi

    # Copy the config
    cp -r "$SCRIPT_DIR/$source" "$target"
    success "$description copied to $target"
    echo ""
}
copy_config ".config/nvim" "$HOME/.config/nvim" "Neovim config"
copy_config ".config/alacritty" "$HOME/.config/alacritty" "Alacritty config"
copy_config ".config/lazygit" "$HOME/.config/lazygit" "Lazygit config"
copy_config ".tmux.conf" "$HOME/.tmux.conf" "Tmux config"
copy_config ".zshrc" "$HOME/.zshrc" "Zsh config"
copy_config ".p10k.zsh" "$HOME/.p10k.zsh" "Powerlevel10k config"
copy_config "./scripts/switch_theme.sh" "$HOME/.local/bin"

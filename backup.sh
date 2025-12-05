#!/bin/bash

set -e  # Exit on error

BACKUP_DIR="$(dirname `pwd`)"

. helpers.sh

backup_config() {
    local source=$1
    local target=$2
    local description=$3

    info "Backing up $description..."

    if [[ ! -e "$source" ]]; then
        error "Source not found: $source (skipping)"
        return 1
    fi

    # Remove existing target to avoid merging
    if [[ -e "$target" ]]; then
        info "Removing old backup at $target"
        rm -rf "$target"
    fi

    # Create parent directory if needed
    local target_dir=$(dirname "$target")
    if [[ ! -d "$target_dir" ]]; then
        mkdir -p "$target_dir"
    fi

    # Copy the config
    cp -r "$source" "$target"
    success "$description backed up to $target"
    echo ""
}

backup_config "$HOME/.config/nvim" "$BACKUP_DIR/.config/nvim" "Neovim config"
backup_config "$HOME/.config/alacritty" "$BACKUP_DIR/.config/alacritty" "Alacritty config"
backup_config "$HOME/.config/lazygit" "$BACKUP_DIR/.config/lazygit" "Lazygit config"
backup_config "$HOME/.tmux.conf" "$BACKUP_DIR/.tmux.conf" "Tmux config"
backup_config "$HOME/.zshrc" "$BACKUP_DIR/.zshrc" "Zsh config"
backup_config "$HOME/.p10k.zsh" "$BACKUP_DIR/.p10k.zsh" "Powerlevel10k config"

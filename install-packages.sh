#!/usr/bin/env bash

set -e

echo "Checking required packages..."

install_if_missing() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Installing $1..."
    sudo apt install -y "$2"
  else
    echo "$1 already installed"
  fi
}

# Core utilities

install_if_missing fzf fzf
install_if_missing rg ripgrep
install_if_missing starship starship
install_if_missing direnv direnv

# zsh plugins

if [ ! -d /usr/share/zsh-autosuggestions ]; then
  sudo apt install -y zsh-autosuggestions
fi

if [ ! -d /usr/share/zsh-syntax-highlighting ]; then
  sudo apt install -y zsh-syntax-highlighting
fi

# optional tools

install_if_missing bottom bottom
install_if_missing aria2c aria2

echo "Setup complete!"

mv .zshrc ~/

# Dotfiles Setup

A personal Zsh configuration for Ubuntu/Debian systems, designed to provide a productive terminal environment with enhanced shell features, keybindings, and essential tools.

## Prerequisites

Before installing these dotfiles, ensure you have:

- **Zsh** installed (check with `zsh --version`).  
  ```bash
  sudo apt update
  sudo apt install zsh
  
---

## Features

### Zsh Configuration

- Enhanced completion system with `compinit`
- Custom keybindings for editing and navigation
- History management with duplicates ignored and shared across sessions
- Colored prompts and terminal title customization
- Handy aliases for common commands and navigation shortcuts
- Integrated `fzf` for fuzzy searching
- Integrated `direnv` for environment variable management
- Support for `nvm` (Node Version Manager)
- Starship prompt integration

### Syntax Highlighting & Autosuggestions

- `zsh-syntax-highlighting` for command highlighting
- `zsh-autosuggestions` for inline suggestions

### Core Utilities

- `fzf` — fuzzy finder
- `ripgrep` — fast search tool
- `starship` — customizable prompt
- `direnv` — environment manager

### Optional Tools

- `bottom` — system monitoring
- `aria2` — download accelerator

### Welcome Messages

- Distinct messages for normal and root users

---

## Cloning the Repository

```bash
git clone https://github.com/kencal20/.dotfiles.git ~/
cd ~/.dotfiles
```

# Make the install script executable

```bash
chmod +x install-packages.sh
```

# Run with explicit Bash

```bash
bash ./install-packages.sh
```

# Or execute directly if permissions are set

```bash
./install-packages.sh
```

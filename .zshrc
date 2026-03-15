#!/usr/bin/env zsh
# ~/.zshrc file for zsh interactive shells.

# Enable color support
export TERM=xterm-256color

setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst
setopt extendedglob

WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=""

# Keybindings
bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo

# Enhanced completion system
autoload -Uz compinit
compinit -C
_comp_options+=(globdots)

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
alias history="history 0"

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Terminal title
case "$TERM" in
xterm*|rxvt*|alacritty|foot|konsole*)
    precmd() {
        print -Pn "\e]0;%n@%m: %~\a"
    }
    ;;
esac

# LS colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:ex=01;32:'

# Common aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -la'
alias lsd='ls -d */'

# zsh-syntax-highlighting
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'
    ZSH_HIGHLIGHT_STYLES[path-invalid]='fg=white'
    ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
fi

# zsh-autosuggestions
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999,bold'
    bindkey '^ ' autosuggest-accept
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Custom aliases
alias read_doc='man zshbuiltins | grep "read"'
alias suspend='systemctl suspend'
alias hibernate='sudo systemctl hibernate'
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias clean='sudo apt autoremove && sudo apt autoclean'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias btm="bottom"
alias adown='aria2c -s16 -x16 -c'

# Welcome message
if [[ -o interactive ]]; then
    if [[ $EUID -eq 0 ]]; then
        echo -e "\e[1;31m⚠️  WARNING: You are ROOT!\e[0m"
    else
        echo -e "\e[1;32mWelcome back, $(whoami)!\e[0m"
    fi
    echo ""
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# FZF
if command -v fzf >/dev/null 2>&1; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh 2>/dev/null || true
    source /usr/share/doc/fzf/examples/completion.zsh 2>/dev/null || true
fi

# Path
export PATH=~/bin:$PATH

eval "$(carapace _carapace zsh)"



xset led 3

# Starship prompt (FINAL — must be last)
eval "$(starship init zsh)"

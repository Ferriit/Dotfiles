# ~/.zshrc

# Avoid running in non-interactive shells
[[ $- != *i* ]] && return

# -----------------------
# PATH and Environment
# -----------------------

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="$HOME/zig-linux-x86_64-0.14.0:$PATH"
export PATH="$HOME/terminal-doom/zig-out/bin:$PATH"
export PATH="$HOME/opt/cross/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/home/ferriit/.spicetify"

# Load Rust environment
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# -----------------------
# Git Prompt
# -----------------------

autoload -Uz colors add-zsh-hook compinit
colors
compinit

parse_git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n $branch ]] && echo " [$branch]"
}

set_prompt() {
  PS1="%F{69}%n%f@%F{33}%m %F{99}%1~%f%F{135}$(parse_git_branch)%f ➜ "
}

add-zsh-hook precmd set_prompt

# -----------------------
# Plugins
# -----------------------

# Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be last)
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -----------------------
# Optional: ASCII System Info
# -----------------------

neofetch --ascii_distro arch


autoload -Uz compinit promptinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Define the theme
PROMPT="%F{51}[%n %~]%f "

# aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# path
PATH="$PATH:$HOME/.local/bin"
export PATH

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

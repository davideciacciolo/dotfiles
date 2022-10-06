# add user bin folder to PATH
export PATH=$PATH:$HOME/bin

# Aliases should go in this file
source "$XDG_CONFIG_HOME/zsh/aliases"

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source "$HOME/dotfiles/zsh/external/completion.zsh"

# Autoload everything in 'external' directory
fpath=($ZDOTDIR/external $fpath)

# autoload -Uz prompt_purification_setup; prompt_purification_setup
source "$XDG_CONFIG_HOME/zsh/prompt"

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Enable Vi Mode
bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# plugin for jumping to a parent directory
source "$HOME/dotfiles/zsh/external/bd.zsh"

# Fuzzy Finder fzf
if [ $(command -v "fzf") ]; then
    source "/usr/share/fzf/completion.zsh"
    source "/usr/share/fzf/key-bindings.zsh"
fi

# source syntax highlighting plugin (this should be added at the end)
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"



# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/davide/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Load version control information
#autoload -Uz vcs_info
#precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:git:*' formats '%b'
# Set up the prompt (with git branch name)
#setopt PROMPT_SUBST
#PROMPT="%F{green}%n@%M%f:%F{blue}%~%f (${vcs_info_msg_0_})$ "

PROMPT="%F{green}%n@%M%f:%F{blue}%~%f$ "

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

# add user bin folder to PATH
export PATH=$PATH:$HOME/bin

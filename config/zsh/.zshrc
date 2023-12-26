# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Case-insensitive completion
CASE_SENSITIVE="false"

# Oh-my-zsh updates
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# The only timestamp format for adults
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(git)

# Source omz at this point
source $ZSH/oh-my-zsh.sh

# Source the profile
source $HOME/.zprofile

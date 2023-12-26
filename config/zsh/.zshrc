# Path to oh-my-zsh
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

# Theme
export ZSH_THEME="af-magic"

# Source omz at this point
source $ZSH/oh-my-zsh.sh

# Finally, source the profile
source $HOME/.zprofile

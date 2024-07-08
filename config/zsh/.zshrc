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
plugins=(git virtualenv)

# Theme
export ZSH_THEME="af-magic"

# Source OMZ at this point
source $ZSH/oh-my-zsh.sh

# Disable this setting enabled by OMZ, which shares history between panes
unsetopt share_history

# Finally, source the profile
source $HOME/.zprofile

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rka/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rka/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rka/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rka/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

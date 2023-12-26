# Configuration
export TERM="xterm"
export TERMINAL="xterm"
export ZSH_THEME="af-magic"
export EDITOR="nvim"
export VISUAL="nvim"

# Clean up bash history
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# Binaries with dependent library files in their own subdirectories
export PATH="$HOME/dotfiles/neovim/bin:$PATH"

# Single file binaries
export PATH="$HOME/dotfiles/bin:$PATH"

# Time savers
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gd="git diff"

# Danger zone
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

# Watch command for nvidia-smi, df, free...
alias wa="watch -n 0,1 "

# Tmux
alias tnew='tmux new -s'
alias tattach='tmux attach -t'

# Force of habit
alias ll='ls -alF'


# Configuration
export TERM="xterm"
export TERMINAL="xterm"
export EDITOR="nvim"
export VISUAL="nvim"

# Clean up bash history
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# Add scripts and applications to path
export PATH="$HOME/dotfiles/scripts:$HOME/dotfiles/applications:$PATH"

# Time savers
alias v="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias dud="du . --max-depth=1"

# The rest of git aliases come from OMZ
alias gs="git status"

# Danger zone
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

# Watch command for nvidia-smi, df, free...
alias wa="watch -n 0,1"

# Tmux
alias tnew="tmux new -s"
alias tattach="tmux attach -t"
alias tls="tmux ls"

# Force of habit
alias ll="ls -alF"

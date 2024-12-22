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
alias ....="cd ../../.."
alias dud="du -h . --max-depth=1 | sort -h"
alias journal="journalctl -xeu"

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
alias ta="tmux a"

# Tree list of directory
alias ll="eza --long --icons --git --all --sort modified"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="eza --tree --level=2 --long --icons --git --all"

# Docker helpers
# Run bash in image
alias dish="docker run --rm -it --entrypoint bash "
# Run bash in container (aliases don't support parameters, hack around this with a function)
dcsh () {
    docker exec -it "$1" bash
}

# Configuration
export TERM="xterm"
export TERMINAL="xterm"
export EDITOR="nvim"
export VISUAL="nvim"

# Clean up bash history
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# Add scripts and applications to path
export PATH="$HOME/dotfiles/scripts:$PATH"

# Prepend global NPM packages
export PATH=$HOME/.npm-global/bin:$PATH

# Append flatpaks (for dmenu)
export PATH=$PATH:/var/lib/flatpak/exports/bin/

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

# Remove metadata of a file
alias rmeta="exiftool -all= -overwrite_original "

# Check error logs of systemd services since last boot
alias clogs="journalctl -p 3 -xb"

# Remove all unused packages
alias pacgc="pacman -Qtdq | sudo pacman -Rns -"

# Run bash in docker image
alias dish="docker run --rm -it --entrypoint bash "

# The following are implemented as functions, as aliases don't support parameters.

# Run bash in docker image after mounting a volume
dishv () {
    docker run -v "$2" --rm -it --entrypoint bash "$1"
}

# Run bash in docker container
dcsh () {
    docker exec -it "$1" bash
}

# Change directory and immediately run `ll`
cdl () {
    cd $1; ll
}

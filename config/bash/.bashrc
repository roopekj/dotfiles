# Clean up bash history
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# Binaries with dependent library files in their own subdirectories
export PATH="$HOME/dotfiles/neovim/bin:$PATH"

# Scripts
export PATH="$HOME/dotfiles/scripts:$PATH"

# Defaults (xterm-kitty breaks clear with `database inaccessible` and screen-256color breaks special keys like END)
export TERM="xterm"
export TERMINAL="xterm"

# Time savers
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gd="git diff"

# Danger zone
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

# Watch commands such as nvidia-smi, df and free
alias wa="watch -n 0,1"


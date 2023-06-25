# Add bash config to system .bashrc
cat config/bash/bashrc >> ~/.bashrc

# Use tmux.conf from this repo
echo "source-file $HOME/dotfiles/config/tmux/tmux.conf" > ~/.tmux.conf

# Add repo's bash config to system .bashrc if not already present
grep -qxF 'source $HOME/dotfiles/config/bash/bashrc' ~/.bashrc || echo 'source $HOME/dotfiles/config/bash/bashrc' >> ~/.bashrc

# Use tmux.conf from this repo
echo "source-file $HOME/dotfiles/config/tmux/tmux.conf" > ~/.tmux.conf

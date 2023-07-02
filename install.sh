# Add repo's bash config to system .bashrc if not already present
grep -qxF 'source $HOME/dotfiles/config/bash/bashrc' ~/.bashrc || echo 'source $HOME/dotfiles/config/bash/bashrc' >> ~/.bashrc

# Install Tmux Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Use tmux.conf from this repo
echo "source-file $HOME/dotfiles/config/tmux/tmux.conf" > ~/.tmux.conf

# Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip

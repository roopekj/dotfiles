# Add repo's bash config to system .bashrc if not already present
grep -qxF 'source $HOME/dotfiles/config/bash/.bashrc' ~/.bashrc || echo 'source $HOME/dotfiles/config/bash/.bashrc' >> ~/.bashrc

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
sudo apt install breeze-icon-theme	# This is for krusader

# Software
sudo apt install kitty
sudo apt install i3
sudo apt install krusader

# ZSH
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Symlink configs (careful, these overwrite previous files under $HOME and $HOME/.config)
ln -sf ~/dotfiles/config/i3 ~/.config/
ln -sf ~/dotfiles/config/i3status ~/.config/
ln -sf ~/dotfiles/config/kitty ~/.config/
ln -sf ~/dotfiles/config/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/config/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/config/zsh/.zprofile ~/.zprofile

# Make the local scripts executable so that they can actually be run
chmod +x ~/dotfiles/scripts/tat

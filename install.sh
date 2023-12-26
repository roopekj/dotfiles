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

# i3wm
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
rm keyring.deb

# Install packages
sudo apt update
sudo apt install neovim
sudo snap install --classic code	# Cry about it
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
ln -sf ~/dotfiles/config/conda/.condarc ~/.condarc

# Make the local scripts executable so that they can actually be run
chmod +x ~/dotfiles/scripts/tat

# Conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init zsh
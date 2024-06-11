# Fail of first error
set -e

# Add repo's bash config to system .bashrc if not already present
grep -qxF 'source $HOME/dotfiles/config/bash/.bashrc' $HOME/.bashrc || echo 'source $HOME/dotfiles/config/bash/.bashrc' >> $HOME/.bashrc

# Install Tmux Package Manager
rm -rf ./tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Use tmux.conf from this repo
echo "source-file $HOME/dotfiles/config/tmux/tmux.conf" > $HOME/.tmux.conf

# Fonts
mkdir -p $HOME/.local/share/fonts
cd $HOME/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip
sudo apt install breeze-icon-theme	# This is for krusader

# i3wm
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt install i3
yes | rm keyring.deb

# Neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage.sha256sum
sha256sum -c "nvim.appimage.sha256sum"
mv nvim.appimage applications/
yes | rm nvim.appimage.sha256sum
sudo ln -s $HOME/dotfiles/applications/nvim.appimage /usr/bin/nvim

# Install packages
sudo apt update
sudo snap install --classic code	    # Cry about it
sudo apt install kitty
sudo apt install krusader
sudo apt install feh                	# Setting the background
sudo apt install ripgrep	    	    # Searching with grep inside nvim
sudo apt install maim xdotool           # Screenshots

# ZSH
sudo apt install zsh
yes no | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Symlink configs (NOTE: these overwrite previous files under $HOME and $HOME/.config)
ln -sf $HOME/dotfiles/config/i3 $HOME/.config/
ln -sf $HOME/dotfiles/config/i3status $HOME/.config/
ln -sf $HOME/dotfiles/config/kitty $HOME/.config/
ln -sf $HOME/dotfiles/config/zsh/.zshenv $HOME/.zshenv
ln -sf $HOME/dotfiles/config/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/config/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/config/conda/.condarc $HOME/.condarc

# Make local scripts and applications executable for the user
chmod u+x $HOME/dotfiles/scripts/tat
chmod u+x $HOME/dotfiles/applications/nvim.appimage

# Conda
mkdir -p $HOME/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3/miniconda.sh
bash $HOME/miniconda3/miniconda.sh -b -u -p $HOME/miniconda3
rm -rf $HOME/miniconda3/miniconda.sh
$HOME/miniconda3/bin/conda init zsh

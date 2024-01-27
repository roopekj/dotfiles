# Fail on first error
set -e

# Upgrade packages
sudo pacman -Syu

# Add repo's bash config to system .bashrc if not already present
grep -qxF 'source $HOME/dotfiles/config/bash/.bashrc' $HOME/.bashrc || echo 'source $HOME/dotfiles/config/bash/.bashrc' >> $HOME/.bashrc

# Install Tmux Package Manager
rm -rf ./tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Use tmux.conf from this repo
echo "source-file $HOME/dotfiles/config/tmux/tmux.conf" > $HOME/.tmux.conf

# Fonts
mkdir -p $HOME/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
mv DroidSansMNerdFont-Regular.otf $HOME/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
sudo pacman -S unzip --noconfirm
unzip -o JetBrainsMono.zip -d $HOME/.local/share/fonts
rm JetBrainsMono.zip
sudo pacman -S breeze-icons	--noconfirm        # This is for krusader

# i3wm
sudo pacman -S i3-wm --noconfirm

# Neovim
sudo pacman -S neovim --noconfirm

# Install packages
sudo pacman -S tmux --noconfirm
sudo pacman -S code --noconfirm
sudo pacman -S kitty --noconfirm
sudo pacman -S krusader --noconfirm
sudo pacman -S feh --noconfirm                # Setting the background

# ZSH
sudo pacman -S zsh --noconfirm
rm -rf $HOME/.oh-my-zsh
yes no | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Symlink configs (NOTE: these overwrite previous files under $HOME and $HOME/.config)
rm -rf $HOME/.config/i3 $HOME/.config/i3status 
ln -sf $HOME/dotfiles/config/i3 $HOME/.config/
ln -sf $HOME/dotfiles/config/i3status $HOME/.config/
ln -sf $HOME/dotfiles/config/kitty $HOME/.config/
ln -sf $HOME/dotfiles/config/nvim $HOME/.config
ln -sf $HOME/dotfiles/config/zsh/.zshenv $HOME/.zshenv
ln -sf $HOME/dotfiles/config/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/config/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/config/conda/.condarc $HOME/.condarc

# Make local scripts and applications executable for the user
chmod u+x $HOME/dotfiles/scripts/tat

# Conda
mkdir -p $HOME/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3/miniconda.sh
bash $HOME/miniconda3/miniconda.sh -b -u -p $HOME/miniconda3
rm -rf $HOME/miniconda3/miniconda.sh
which zsh | sudo tee -a /etc/shells
$HOME/miniconda3/bin/conda init zsh

# Sound
sudo pacman -S alsa-utils --noconfirm
amixer sset Master unmute

# Laptop screen brightness
sudo pacman -S brightnessctl --noconfirm
sudo usermod -aG video $USER

# Facilitate screen locking
sudo pacman -S xss-lock --noconfirm

# Misc
sudo pacman -S tig extra/xorg-xrandr man-pages man-db network-manager-applet sshuttle --noconfirm

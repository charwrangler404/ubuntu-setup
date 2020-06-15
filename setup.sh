#!/usr/bin/env bash


# Install and update useful packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y terminator neovim zsh git
sudo apt-get install -y neofetch htop vlc curl wget
sudo apt-get install -y python3-pip

# Set up zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

sed 's/robbyrussell/steeef/g' ~/.zshrc >> ~/.zshrc

# Set up aliases
echo "alias vim=nvim" >> ~/.zshrc
echo "alias vi=nvim" >> ~/.zshrc
echo "alias ls='ls -l'" >> ~/.zshrc

# Set up nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./config/init.vim ~/.config/nvim/init.vim
python -m pip install setuptools
python -m pip install --upgrade pynvim
python2 -m pip install --upgrade pynvim
python3 -m pip install --upgrade pynvim
nvim -c PlugInstall -c q -c q

# Install NordVPN
sudo dpkg -i ./deb/nordvpn-release_1.0.0_all.deb
sudo apt-get update
sudo apt-get install -y nordvpn


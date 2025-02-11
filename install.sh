#!/bin/bash


## script for installing every software

# initial installation
echo "initial install"
sudo pacman -Syu
sudo pacman -S wget
sudo pacman -S desktop-file-utils
cd ~/Downloads

# install rust
echo "install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install git
echo "install git"
sudo pacman -S git

# install browsers. brave and firefox
echo "install browsers"
curl -fsS https://dl.brave.com/install.sh | sh
sudo pacman -S firefox-developer-edition

# install helix editor
echo "install helix"
sudo pacman -S helix

# install alacritty terminal
echo "install terminal"
sudo pacman -S alacritty

# install anki
echo "install anki"
sudo echo -n "enter anki version: "
read anki_ver
sudo wget "https://github.com/ankitects/anki/releases/download/$anki_ver/anki-$anki_ver-linux-qt6.tar.zst"
sudo tar -xvf "./anki-$anki_ver-linux-qt6.tar.zst"
sudo chmod +x ./"anki-$anki_ver-linux-qt6/install.sh"
echo "install script"
sudo ./"anki-$anki_ver-linux-qt6/install.sh"

# install VPN
echo "install VPN"
pacman -S openvpn

# install font
echo "install font"
pacman -S ttf-jetbrains-mono-nerd

# install hellij
echo "install zellij"
pacman -S zellij 

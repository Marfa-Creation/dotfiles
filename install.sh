#!/bin/bash


## script for installing every software

# initial installation
echo "initial install"
sudo pacman -Syu
sudo pacman -S wget
sudo pacman -S desktop-file-utils
sudo pacman -S base-devel
cd ~/Downloads

# install rust
echo "install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install git
echo "install git"
sudo pacman -S git

# install npm
echo "install npm"
sudo pacman -S npm

# install yay AUR helper
echo "install AUR helper"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

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

# install starship
echo "install starship"
curl -sS https://starship.rs/install.sh | sh

# install anki
echo "install anki"
sudo echo -n "enter anki version: "
read anki_ver
sudo wget "https://github.com/ankitects/anki/releases/download/$anki_ver/anki-$anki_ver-linux-qt6.tar.zst"
sudo tar -xvf "./anki-$anki_ver-linux-qt6.tar.zst"
sudo chmod +x ./"anki-$anki_ver-linux-qt6/install.sh"
cd ./anki-$anki_ver-linux-qt6
sudo ./install.sh
cd ..

# install VPN
echo "install VPN"
pacman -S openvpn

# install font
echo "install font"
pacman -S ttf-jetbrains-mono-nerd
sudo pacman -S adobe-source-han-sans-jp-fonts

# install hellij
echo "install zellij"
pacman -S zellij 

# install file manager
echo "install file manager"
sudo pacman -S ranger

# install pomodoro time
echo "install pomodoro timer"
sudo wget "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-pomodoro.tar.gz"
tar -xvf gnome-shell-pomodoro.tar.gz && cd gnome-shell-pomodoro
makepkg -s
makepkg -i

# install screenshot program
echo "install screenshot program"
sudo pacman -S spectacle

# install fastfetch
echo "install fastfetch"
sudo pacman -S fastfetch

# install system monitor
echo "install system monitor"
sudo pacman -S btop

# install document editor
echo "install document editor"
yay -S onlyoffice-bin

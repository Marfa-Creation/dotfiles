#!/bin/bash

## script for installing every software

RED='\033[0;31m'
NC='\033[0m'

# initial installation
echo -e "${RED}initial install${NC}"
sudo pacman -Syu
sudo pacman -S wget
sudo pacman -S desktop-file-utils
sudo pacman -S base-devel
cd ~/Downloads

# install rust
echo -e "${RED}install rust${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install git
echo -e "${RED}install git${NC}"
sudo pacman -S git

# install npm
echo -e "${RED}install npm${NC}"
sudo pacman -S npm

# install bun
echo -e "${RED}install bun${NC}"
curl -fsSL https://bun.sh/install | bash

# install yay AUR helper
echo -e "${RED}install AUR helper${NC}"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

# install pacman-static
echo -e "${RED}install pacman-static${NC}"
yay -S pacman-static

# install browsers. brave and firefox
echo -e "${RED}install browsers${NC}"
curl -fsS https://dl.brave.com/install.sh | sh
sudo pacman -S firefox-developer-edition

# install helix editor
echo -e "${RED}install helix${NC}"
sudo pacman -S helix

# install copy-paste program
echo -e "${RED}install copy-paste program${NC}"
sudo pacman -S wl-clipboard

# install LSP & formatter
echo -e "${RED}install LSP & formatter${NC}"
npm i -g vscode-langservers-extracted
npm i -g @tailwindcss/language-server
npm i -g bash-language-server
npm install -g typescript typescript-language-server
npm i -g @vue/language-server
npm i -g prettier
npm i -g sql-language-server
cargo install taplo-cli --features lsp
sudo pacman -S shfmt


# install alacritty terminal
echo -e "${RED}install terminal${NC}"
sudo pacman -S kitty picom

# install starship
echo -e "${RED}install starship${NC}"
curl -sS https://starship.rs/install.sh | sh

# install anki
echo -e "${RED}install anki${NC}"
sudo echo -e -${RED}n "enter anki version: ${NC}"
read anki_ver
sudo wget "https://github.com/ankitects/anki/releases/download/$anki_ver/anki-$anki_ver-linux-qt6.tar.zst"
sudo tar -xvf "./anki-$anki_ver-linux-qt6.tar.zst"
sudo chmod +x ./"anki-$anki_ver-linux-qt6/install.sh"
cd ./anki-$anki_ver-linux-qt6
sudo ./install.sh
cd ..

# install appimagelauncher
echo -e "${RED}install appimagelauncher${NC}"
yay -S appimagelauncher

# install zoxide
echo -e "${RED}install zoxide${NC}"
sudo pacman -S zoxide

# install dunst
echo -e "${RED}install dunst${NC}"
sudo pacman -S dunst

# install VPN
echo -e "${RED}install VPN${NC}"
pacman -S openvpn

# install font
echo -e "${RED}install font${NC}"
sudo pacman -S ttf-jetbrains-mono-nerd \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-emoji \
	ttf-font-awesome

# install input method program
echo -e "${RED}install input method program${NC}"
sudo pacman -S fcitx5-im fcitx5-anthy fcitx5-configtool wev

# install file manager
echo -e "${RED}install file manager${NC}"
sudo pacman -S yazi nemo
ya pkg add boydaihungst/gvfs
sudo pacman -S gvfs glib2
sudo pacman -S gvfs-mtp gvfs-afc gvfs-google gvfs-gphoto2 gvfs-nfs gvfs-smb gvfs-afc gvfs-dnssd gvfs-goa gvfs-onedrive gvfs-wsdd
yay -S simple-mtpfs

# install pomodoro time
echo -e "${RED}install pomodoro timer${NC}"
yay -S gnome-shell-pomodoro

# install screen capture program
echo -e "${RED}install screen capture program${NC}"
sudo pacman -S grim wf-recorder slurp

# install fastfetch
echo -e "${RED}install fastfetch${NC}"
sudo pacman -S fastfetch imagemagick

# install shell
echo -e "${RED}install shell${NC}"
sudo pacman -S nushell

# install system monitor
echo -e "${RED}install system monitor${NC}"
sudo pacman -S btop

# install document utils 
echo -e "${RED}install document utils${NC}"
yay -S onlyoffice-bin logseq-desktop-bin
sudo pacman -S okular

# install multimedia utils
echo -e "${RED}install multimedia utils${NC}"
sudo pacman -S eog mpv vvave

# install audio utils
echo -e "${RED}install audio utils${NC}"
sudo pacman -S pipewire pipewire-pulse wireplumber \
pavucontrol

# install network utils
echo -e "${RED}install network utils${NC}"
pacman -S networkmanager

# install sway utils
echo -e "${RED}install other utils{NC}"
yay -S swaylock-effects
sudo pacman -S sway swaybg swayidle \
rofi-wayland rofi-calc \
waybar 
yay -S light

# install hyprland utils
echo -e "${RED}install hyprland utils{NC}"
sudo pacman -S xdg-desktop-portal-hyprland hyprpolkitagent
sudo pacman -S qt5-wayland qt6-wayland
sudo pacman -S hyprpaper

#!/bin/nu

touch ./log
let log: string = open ./log | str trim;

def is_done [name: string] {
   $log | lines | any {|i| $i.name == name} 
}

def done [name: string] {
  $"($name)\n" | save -a ./log
}

def big_text [text: string] {
  print $"(ansi greenyellow)(/usr/bin/figlet $text)(ansi reset)"
} 

# initial installation
sudo pacman -Syu curl wget desktop-file-utils base-devel figlet

# install rust
if (is_done 'install rust') == false {
  big_text 'install rust'
  ^curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | ^sh
  done 'install rust'
}

# install git
if (is_done 'install git') == false {
  big_text 'install git'
  sudo pacman -S git
  done 'install git'
}

# install yay AUR helper
if (is_done 'install AUR helper') == false {
  big_text 'install AUR helper'
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin 
  makepkg -si 
  cd .. 
  done 'install AUR helper'
}

# install npm
if (is_done 'install npm') == false {
  big_text 'install npm'
  sudo pacman -S npm
  npm config set prefix ~/.npm-global
  done 'install npm'
}

# install bun
if (is_done 'install bun') == false {
  big_text 'install bun'
  sudo pacman -S unzip
  /usr/bin/nu -c "curl -fsSL https://bun.sh/install | bash"
  done 'install bun'
}

# install tablet driver
if (is_done 'install tablet driver') == false {
  big_text 'install tablet driver'
  yay -S opentabletdriver
  done 'install tablet driver'
}

# install pacman-static
if (is_done 'install pacman-static') == false {
  big_text 'install pacman-static'
  yay -S pacman-static
  done 'install pacman-static'
}

# install browser
if (is_done 'install browsers') == false {
  big_text 'install browsers'
  /usr/bin/nu -c "curl -fsS https://dl.brave.com/install.sh | sh"
  yay -S zen-browser-bin
  sudo pacman -S firefox-developer-edition
  done 'install browsers'
}

# install helix
if (is_done 'install helix editor') == false {
  big_text 'install helix editor'
  sudo pacman -S helix
  done 'install helix editor'
}

# install syncthing
if (is_done 'install syncthing') == false {
  big_text 'install syncthing'
  sudo pacman -S syncthing
  done 'install syncthing'
}

# install clipboard manager
if (is_done 'install clipboard manager') == false {
  big_text 'install clipboard manager'
  sudo pacman -S wl-clipboard
  done 'install clipboard manager'
}

# install docker
if (is_done 'install docker') == false {
  big_text 'install docker'
  sudo pacman -S docker-buildx docker-compose
  done 'install docker'
}

# install LSP & formatter
if (is_done 'install LSP & formatter') == false {
  big_text 'install LSP & formatter'
  npm i -g vscode-langservers-extracted
  npm install -g dockerfile-language-server-nodejs
  npm install -g @microsoft/compose-language-service
  npm i -g @tailwindcss/language-server
  npm i -g bash-language-server
  npm install -g typescript typescript-language-server
  npm i -g @vue/language-server
  npm i -g prettier
  npm i -g sql-language-server
  cargo install taplo-cli --features lsp
  sudo pacman -S shfmt
  rustup component add rust-analyzer
  done 'install LSP & formatter'
}

# install terminal
if (is_done 'install terminal') == false {
  big_text 'install terminal'
  sudo pacman -S kitty picom
  done 'install terminal'
}

# install starship
if (is_done 'install starship') == false {
  big_text 'install starship'
  sudo pacman -S starship
  done 'install starship'
}

# install anki
if (is_done 'install anki') == false {
  big_text 'install anki'
  yay -S anki-bin
  done 'install anki'
}

# install appimagelauncher
if (is_done 'install appimagelauncher') == false {
  big_text 'install appimagelauncher'
  yay -S appimagelauncher
  done 'install appimagelauncher'
}

# install zoxide
if (is_done 'install zoxide') == false {
  big_text 'install zoxide'
  sudo pacman -S zoxide
  done 'install zoxide'
}

# install bat
if (is_done 'install bat') == false {
  big_text 'install bat'
  sudo pacman -S bat
  done 'install bat'
}

# install ripgrep
if (is_done 'install ripgrep') == false {
  big_text 'install ripgrep'
  sudo pacman -S ripgrep
  done 'install ripgrep'
}

# install dunst
if (is_done 'install dunst') == false {
  big_text 'install dunst'
  sudo pacman -S dunst
  done 'install dunst'
}

# install VPN
if (is_done 'install VPN') == false {
  big_text 'install VPN'
  sudo pacman -S openvpn wireguard-tools systemd-resolvconf proton-vpn-gtk-app
  done 'install VPN'
}

# install font
if (is_done 'install font') == false {
  big_text 'install font'
  sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome
  done 'install font'
}

# install input method program
if (is_done 'install input method program') == false {
  big_text 'install input method program'
  sudo pacman -S fcitx5-im fcitx5-anthy fcitx5-configtool wev
  done 'install input method program'
}

# install install QT & GTK config tool
if (is_done 'install QT & GTK config tool') == false {
  big_text 'install QT & GTK config tool'
  sudo pacman -S qt5ct qt6ct nwg-look
  done 'install QT & GTK config tool'
}

# install file manager
if (is_done 'install file manager') == false {
  big_text 'install file manager'
  sudo pacman -S yazi nemo
  ya pkg add boydaihungst/gvfs
  sudo pacman -S gvfs glib2
  sudo pacman -S gvfs-mtp gvfs-afc gvfs-google gvfs-gphoto2 gvfs-nfs gvfs-smb gvfs-afc gvfs-dnssd gvfs-goa gvfs-onedrive gvfs-wsdd
  yay -S simple-mtpfs
  done 'install file manager'
}

# install pomodoro timer
if (is_done 'install pomodoro timer') == false {
  big_text 'install pomodoro timer'
  yay -S gnome-shell-pomodoro
  done 'install pomodoro timer'
}

# install screen capture program
if (is_done 'install screen capture program') == false {
  big_text 'install screen capture program'
  sudo pacman -S grim wf-recorder slurp
  done 'install screen capture program'
}

# install fastfetch
if (is_done 'install fastfetch') == false {
  big_text 'install fastfetch'
  sudo pacman -S fastfetch imagemagick
  done 'install fastfetch'
}

# install system monitor
if (is_done 'install system monitor') == false {
  big_text 'install system monitor'
  sudo pacman -S btop
  done 'install system monitor'
}

# install document utils
if (is_done 'install document utils') == false {
  big_text 'install document utils'
  yay -S onlyoffice-bin logseq-desktop-bin
  sudo pacman -S okular
  done 'install document utils'
}

# install multimedia utils
if (is_done 'install multimedia utils') == false {
  big_text 'install multimedia utils'
  sudo pacman -S eog mpv vvave
  done 'install multimedia utils'
}

# install audio utils
if (is_done 'install audio utils') == false {
  big_text 'install audio utils'
  sudo pacman -S pipewire pipewire-pulse wireplumber pavucontrol
  done 'install audio utils'
}

# install network utils
if (is_done 'install network utils') == false {
  big_text 'install network utils'
  sudo pacman -S networkmanager
  done 'install network utils'
}

# install sway utils
if (is_done 'install sway utils') == false {
  big_text 'install sway utils'
  yay -S swaylock-effects light
  sudo usermod -aG video (^whoami)
  light -N 5
  sudo pacman -S sway swaybg swayidle rofi-wayland rofi-calc waybar
  done 'install sway utils'
}

# install hyprland utils
if (is_done 'install hyprland utils') == false {
  big_text 'install hyprland utils'
  sudo pacman -S xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland hyprpaper
  done 'install hyprland utils'
}

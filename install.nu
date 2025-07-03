#!/bin/nu

touch ./last
let last: string = open ./last | str trim;

# will remember which installation was failed
# and then run from it when the script is re-runned
def run [cmd: list, name: string] {
  print $"command: ($cmd | str join ' ')"
  if $last == $name or $last == "" {
    # mark
    $name | save -f ./last;

    run-external ($cmd)
  
    # reset
    "" | save -f ./last;
  }  
}

def big-text [text: string] {
  print $"(ansi greenyellow)(/usr/bin/figlet $text)(ansi reset)"
} 

# initial installation
run [sudo pacman -Syu] "initial installation"
run [sudo pacman -S wget] "initial installation"
run [sudo pacman -S desktop-file-utils] "initial installation"
run [sudo pacman -S base-devel] "initial installation"
run [sudo pacman -S figlet] "initial installation"

# install rust
big-text 'install rust'
run [/usr/bin/nu -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"] "install rust"

# install git
big-text 'install git'
run [sudo pacman -S git] "install git"

# install npm
big-text 'install npm'
run [sudo pacman -S npm] "install npm"
run [npm config set prefix ~/.npm-global] "install npm"

# install bun
big-text 'install bun'
run [/usr/bin/nu -c "curl -fsSL https://bun.sh/install | bash"] "install bun"

# install tablet driver
big-text "install tablet driver"
run [yay -S opentabletdriver] "install tablet driver"

# install yay AUR helper
big-text 'install AUR helper'
run [git clone https://aur.archlinux.org/yay-bin.git] "install AUR helper"
run [cd yay-bin] "install AUR helper"
run [makepkg -si] "install AUR helper"
run [cd ..] "install AUR helper"

# install pacman-static
big-text 'install pacman-static'
run [yay -S pacman-static] "install pacman-static"

# install browsers. brave and firefox
big-text 'install browsers'
run [/usr/bin/nu -c "curl -fsS https://dl.brave.com/install.sh | sh"] "install browsers"
run [sudo pacman -S firefox-developer-edition] "install browsers"

# install helix editor
big-text 'install helix editor'
run [sudo pacman -S helix] "install helix editor"

# install syncthing
big-text 'install syncthing'
run [sudo pacman -S syncthing] "install syncthing"

# install clipboard manager
big-text 'install clipboard manager'
run [sudo pacman -S wl-clipboard] "install clipboard manager"

# install LSP & formatter
big-text 'install LSP & formatter'
run [npm i -g vscode-langservers-extracted] "install LSP & formatter"
run [npm i -g @tailwindcss/language-server] "install LSP & formatter"
run [npm i -g bash-language-server] "install LSP & formatter"
run [npm install -g typescript typescript-language-server] "install LSP & formatter"
run [npm i -g @vue/language-server] "install LSP & formatter"
run [npm i -g prettier] "install LSP & formatter"
run [npm i -g sql-language-server] "install LSP & formatter"
run [cargo install taplo-cli --features lsp] "install LSP & formatter"
run [sudo pacman -S shfmt] "install LSP & formatter"
run [rustup component add rust-analyzer] "install LSP & formatter"

# install terminal
big-text 'install terminal'
run [sudo pacman -S kitty picom] "install terminal"

# install starship
big-text 'install starship'
run [sudo pacman -S starship] "install starship"

# install anki
big-text 'install anki'
run [yay -S anki-bin] "install anki"

# install appimagelauncher
big-text 'install appimagelauncher'
run [yay -S appimagelauncher] "install appimagelauncher"

# install zoxide
big-text 'install zoxide'
run [sudo pacman -S zoxide] "install zoxide"

# install dunst
big-text 'install dunst'
run [sudo pacman -S dunst] "install dunst"

# install VPN
big-text 'install VPN'
run [sudo pacman -S openvpn] "install VPN"

# install font
big-text 'install font'
run [sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome] "install font"

# install input method program
big-text 'install input method program'
run [sudo pacman -S fcitx5-im fcitx5-anthy fcitx5-configtool wev] "install input method program"

# install QT & GTK config tool
big-text 'install QT & GTK config tool'
run [sudo pacman -S qt5ct qt6ct nwg-look] "install QT & GTK config tool"

# install file manager
big-text 'install file manager'
run [sudo pacman -S yazi nemo] "install file manager"
run [ya pkg add boydaihungst/gvfs] "install file manager"
run [sudo pacman -S gvfs glib2] "install file manager"
run [sudo pacman -S gvfs-mtp gvfs-afc gvfs-google gvfs-gphoto2 gvfs-nfs gvfs-smb gvfs-afc gvfs-dnssd gvfs-goa gvfs-onedrive gvfs-wsdd] "install file manager"
run [yay -S simple-mtpfs] "install file manager"

# install pomodoro timer
big-text 'install pomodoro timer'
run [yay -S gnome-shell-pomodoro] "install pomodoro timer"

# install screen capture program
big-text 'install screen capture program'
run [sudo pacman -S grim wf-recorder slurp] "install screen capture program"

# install fastfetch
big-text 'install fastfetch'
run [sudo pacman -S fastfetch imagemagick] "install fastfetch"

# install system monitor
big-text 'install system monitor'
run [sudo pacman -S btop] "install system monitor"

# install document utils 
big-text 'install document utils '
run [yay -S onlyoffice-bin logseq-desktop-bin] "install document utils"
run [sudo pacman -S okular] "install document utils"

# install multimedia utils
big-text 'install multimedia utils'
run [sudo pacman -S eog mpv vvave] "install multimedia utils"

# install audio utils
big-text 'install audio utils'
run [sudo pacman -S pipewire pipewire-pulse wireplumber pavucontrol] "install audio utils"

# install network utils
big-text 'install network utils'
run [sudo pacman -S networkmanager] "install network utils"

# install sway utils
big-text 'install sway utils'
run [yay -S swaylock-effects light] "install sway utils"
run [sudo usermod -aG video (^whoami)] "install sway utils"
run [light -N 5] "install sway utils"
run [sudo pacman -S sway swaybg swayidle rofi-wayland rofi-calc waybar] "install sway utils"

# install hyprland utils
big-text 'install hyprland utils'
run [sudo pacman -S xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland hyprpaper] "install hyprland utils"

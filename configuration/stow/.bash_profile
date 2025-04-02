#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

/usr/bin/ibus-daemon -dxr

nmcli d wifi connect "pandawa mijil" password "podokarobiyen"

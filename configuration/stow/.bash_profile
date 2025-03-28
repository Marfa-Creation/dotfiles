#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

/usr/bin/ibus-daemon -dxr

nmcli d wifi connect "pandawa mijil" password "podokarobiyen"

# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#   exec startx
# fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
fi

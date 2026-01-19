#!/usr/bin/nu

let win = (^hyprctl activewindow -j | from json);

if $win.floating == true {
    ^notify-send -t 500 "triggered on floating"
    $win.pid | save -f /tmp/last_floating_hypr
    if (^hyprctl dispatch focuswindow $"pid:(open /tmp/last_tiled_hypr)") != "ok" {
        ^hyprctl dispatch cyclenext tiled
    }
} else {
    ^notify-send -t 500 "triggered on tiled"
    $win.pid | save -f /tmp/last_tiled_hypr
    if (^hyprctl dispatch focuswindow $"pid:(open /tmp/last_floating_hypr)") != "ok" {
        ^hyprctl dispatch cyclenext floating
    }
}

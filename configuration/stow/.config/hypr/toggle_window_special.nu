#!/usr/bin/nu


hyprctl activewindow -j | from json | if $in.workspace.name == "special:special" {
  hyprctl dispatch movetoworkspacesilent $"(hyprctl activeworkspace -j | from json | $in.name)"
} else {
  hyprctl dispatch movetoworkspacesilent special:special
}

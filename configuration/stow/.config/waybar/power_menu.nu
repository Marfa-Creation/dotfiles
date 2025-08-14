#!/usr/bin/nu

let options = [
    "Power Off"
    "Reboot"
    "Lock"
    "Suspend"
    "Logout"
]
let choice = $options | str join "\n" | ^rofi -dmenu
print $choice

match $choice {
    "Power Off" => {
        ^systemctl poweroff
    }
    "Reboot" => {
        ^systemctl reboot
    }
    "Lock" => {
    match $env.XDG_CURRENT_DESKTOP  {
            "Hyprland" => {
                ^grim ~/.config/hypr/current-screen.png; ^hyprlock
            }
            _ => {
                ^swaylock
            }
        }
    }
    "Suspend" => {
        ^systemctl suspend
    }
    "Logout" => {
        ^loginctl terminate-user $env.USER
    }
}

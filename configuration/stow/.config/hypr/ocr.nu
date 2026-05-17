#!/usr/bin/env nu

let lang = ^tesseract --list-langs | ^awk 'FNR>1' | ^rofi -dmenu;
^grim -g (slurp) - | ^tesseract -l $lang - - | ^wl-copy

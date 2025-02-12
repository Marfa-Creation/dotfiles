#!/bin/bash

mkdir -p ~/.config
cp -r ./configuration/helix ~/.config

# to make sure yank works
sudo pacman -S wl-clipboard
sudo pacman -S xclip
sudo pacman -S xsel

# install LSP
sudo npm i -g vscode-langservers-extracted
sudo npm i -g @tailwindcss/language-server
cargo install taplo-cli --features lsp


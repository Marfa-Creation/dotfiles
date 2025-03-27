#!/bin/bash

mkdir -p ~/.config
cp -r ./configuration/helix ~/.config

# to make sure yank works
sudo pacman -S wl-clipboard
sudo pacman -S xclip
sudo pacman -S xsel

# install LSP
npm i -g vscode-langservers-extracted
npm i -g @tailwindcss/language-server
npm i -g bash-language-server
cargo install taplo-cli --features lsp

# install formatter
sudo pacman -S shfmt

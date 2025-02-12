#!/bin/bash

mkdir -p ~/.config
cp -r ./configuration/starship.toml ~/.config
# autostart
echo 'eval "$(starship init bash)"' >> ~/.bashrc


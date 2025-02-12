#!/bin/bash

mkdir -p ~/.config
cp -r ./configuration/zellij ~/.config
# autostart
echo 'eval "$(zellij setup --generate-auto-start bash)"' >> ~/.bashrc

#!/bin/bash

sudo pacman -S - < linuxsetup_apps.txt

ln -s $(pwd)/zshrc ~/.zshrc

mkdir -p 

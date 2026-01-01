#!/bin/bash
sudo pacman -S stow

# Key remapping
sudo pacman -S wtype

# Fish shell
sudo pacman -S fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/jhillyerd/plugin-git
chsh -s /usr/bin/fish

# Apps
yay -S zen-browser-bin ticktick

# Install pnpm and Node
curl -fsSL https://get.pnpm.io/install.sh | sh -
pnpm env use --global lts

# Install Bun
curl -fsSL https://bun.com/install | bash

# Install uv and Python
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install --default

# Install Go
sudo pacman -S go

# Remap CapsLock to Ctrl and Esc
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
sudo keyd reload

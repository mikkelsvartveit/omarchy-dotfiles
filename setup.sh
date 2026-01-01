#!/bin/bash

# Install stow and set up dotfiles
sudo pacman -S stow
stow --adopt contents/
git stash -u

# Install wtype for special characters remappings
sudo pacman -S wtype

# Install fish shell
sudo pacman -S fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/jhillyerd/plugin-git
chsh -s /usr/bin/fish

# Install pnpm and Node
curl -fsSL https://get.pnpm.io/install.sh | sh -
pnpm env use --global lts

# Install Bun
curl -fsSL https://bun.com/install | bash

# Install uv, Python, and Poetry
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install --default
curl -sSL https://install.python-poetry.org | python3 -

# Install Go
sudo pacman -S go

# Remap CapsLock to Ctrl and Esc
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
sudo keyd reload

# Install GUI apps
yay -S zen-browser-bin 
yay -S ticktick

# Fix 1Password for Zen
sudo mkdir /etc/1password
sudo touch /etc/1password/custom_allowed_browsers
echo "zen-bin" | sudo tee -a /etc/1password/custom_allowed_browsers

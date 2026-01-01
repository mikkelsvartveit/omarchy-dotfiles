#!/bin/bash

# Fail on error to prevent cascading issues
set -e

# Install stow and set up dotfiles
sudo pacman -S --noconfirm --needed stow
stow --adopt contents/
git stash -u

# Install wtype for special characters remappings
sudo pacman -S --noconfirm --needed wtype

# Install fish shell
sudo pacman -S --noconfirm --needed fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | NONINTERACTIVE=true fish
fish -c "omf install https://github.com/jhillyerd/plugin-git"
sudo usermod --shell /usr/bin/fish $USER

# Install pnpm and Node
curl -fsSL https://get.pnpm.io/install.sh | sh -
fish -c "pnpm env use --global lts"

# Install Bun
curl -fsSL https://bun.com/install | bash

# Install uv, Python, and Poetry
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install --default
curl -sSL https://install.python-poetry.org | python3 - --yes

# Install Go
sudo pacman -S --noconfirm --needed go

# Remap CapsLock to Ctrl and Esc
sudo pacman -S --noconfirm --needed keyd
sudo mkdir -p /etc/keyd
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
sudo keyd reload

# Install GUI apps
sudo pacman -S --noconfirm --needed gnome-calendar
sudo pacman -S --noconfirm --needed geary
yay -S --noconfirm --answerdiff None gnome-online-accounts-gtk
yay -S --noconfirm --answerdiff None zen-browser-bin 
yay -S --noconfirm --answerdiff None ticktick

# Fix 1Password for Zen
sudo mkdir -p /etc/1password
sudo touch /etc/1password/custom_allowed_browsers
echo "zen-bin" | sudo tee /etc/1password/custom_allowed_browsers

# Use media keys as default for Apple keyboards
echo "options hid_apple fnmode=1" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo mkinitcpio -P

echo "Setup script is done!"

sudo pacman -S stow

# Key remapping
sudo pacman -S wtype

# Fish shell
sudo pacman -S fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/jhillyerd/plugin-git
chsh -s /usr/bin/fish

# Zoxide (autojump)
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

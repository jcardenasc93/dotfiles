#### Pkgs Instalation
# Utils packages
sudo dnf install -y btop bat nvim zsh tmux fastfetch stow fzf lsd

# Starship
curl -sS https://starship.rs/install.sh | sh

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

## ZSH setup
chsh -s $(which zsh)

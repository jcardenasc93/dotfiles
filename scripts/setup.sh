#### Pkgs Instalation
# Utils packages
sudo dnf install -y btop bat neovim zsh tmux fastfetch stow fzf lsd flameshot direnv go pulseaudio-libs-devel wayland-devel wayland-protocols-devel meson clipman

# Starship
curl -sS https://starship.rs/install.sh | sh

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# tmux TMP
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## ZSH setup
chsh -s $(which zsh)

## Auido idle inhibit look https://github.com/ErikReider/SwayAudioIdleInhibit
git clone https://github.com/ErikReider/SwayAudioIdleInhibit.git

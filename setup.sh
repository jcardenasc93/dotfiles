# Nix install
sh <(curl -L https://nixos.org/nix/install) --no-daemon # Linux
#NOTE: For linux check if after installation source nix to shell is required! (look .profile file)

# sh <(curl -L https://nixos.org/nix/install) # MacOS

# Install packages
nix-env -iA \
  nixpkgs.zsh \ # Only for linux
  nixpkgs.antibody \
  nixpkgs.ripgrep \
  nixpkgs.fzf \
  nixpkgs.tmux \
  nixpkgs.bat \
  nixpkgs.stow \
  nixpkgs.asdf-vm \
  nixpkgs.kitty \
  nixpkgs.kitty-themes \
  nixpkgs.neovim \
  nixpkgs.starship \
  nixpkgs.direnv \
  nixpkgs.cheat \
  nixpkgs.lazygit \
  nixpkgs.lsd

# stow packages
stow git
stow zsh
stow kitty
stow nvim
stow starship
stow tmux


# Set zsh as default shell (Only for Linux)
sudo chsh -s $(which zsh)

# Install plugins for zsh
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


# Nix install
curl -L https://nixos.org/nix/install | sh 
#NOTE: For linux check if after installation source nix to shell is required! (look .profile file)

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# MacOS only
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

# Install packages
nix-env -iA \
  nixpkgs.zsh \ # Only for linux
  nixpkgs.ripgrep \
  nixpkgs.fzf \
  nixpkgs.tmux \
  nixpkgs.bat \
  nixpkgs.stow \
  nixpkgs.kitty-themes \
  nixpkgs.neovim \
  nixpkgs.starship \
  nixpkgs.direnv \
  nixpkgs.cheat \
  nixpkgs.lazygit \
  nixpkgs.lsd \
  nixpkgs.coreutils \
  nixpkgs.openssl \
  nixpkgs.readline \
  nixpkgs.sqlite \
  nixpkgs.xz \
  nixpkgs.zlib \
  nixpkgs.tcl \
  nixpkgs.curl \
  nixpkgs.libossp_uuid \ # Only for MacOS
  nixpkgs.libuuid \ # Only for linux
  nixpkgs.gawk \
  nix-env -iA nixpkgs.gnupg


  # Linux only
  nixpkgs.gnumake \
  nixpkgs.gcc \
  nixpkgs.bzip2 \
  nixpkgs.libffi

# brew installation
sudo dnf groupinstall "Development Tools" # Linux only
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Linux only (both)
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install --cask kitty
brew tap homebrew/cask-fonts && brew install --cask font-go-mono-nerd-font
brew install asdf
brew install --cask brave-browser

# Antidote to handle zsh plugins
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote



# Dev dependencies
## MacOS Only
xcode-select --install

# stow packages
stow git
stow zsh
stow kitty
stow nvim
stow starship
stow tmux


# Set zsh as default shell (Only for Linux)
sudo chsh -s $(which zsh)
# Install zsh plugins
# generate ~/.zsh_plugins.zsh
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh

# Setup asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

# Install neovim pulgins
nvim --headless +PackerSync +qall

# Setup asdf plugins and install packages
## Node.js
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.17.0
asdf global nodejs 16.17.0 # Set latest 16.x.x version of node as default

## Python
asdf plugin-add python
asdf install python 3.8.8
asdf global python 3.8.8 # Set python 3.8 as default

## Golang
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest

## Postgers
asdf plugin-add postgres
# Check https://github.com/smashedtoatoms/asdf-postgres for postgres setup per project

# Install neovim LSPs
# gopls, sumneko_lua, html, emmet_ls, pyright
nvim --headless +LspInstall gopls +qall
nvim --headless +LspInstall sumneko_lua +qall
nvim --headless +LspInstall emmuet_ls +qall
nvim --headless +LspInstall pyright +qall

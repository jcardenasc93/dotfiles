# This little script syncs dotfiles in the folder where is run

# Sync zshrc
rsync -avu "$HOME/.zshrc" ".zshrc"

# Sync kitty
rsync -avu "$HOME/.config/kitty/" "kitty/"

# Sync tmux
rsync -avu "$HOME/.tmux.conf" ".tmux.conf"
rsync -avu "$HOME/tmux-colorscheme.conf" "tmux-colorscheme.conf"

# Neovim
# mkdir nvim
rsync -avu --delete "$HOME/.config/nvim/" "nvim/"


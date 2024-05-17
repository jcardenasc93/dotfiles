# Set zinit dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if not installed
if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Starship prompt
eval "$(starship init zsh)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# Snippet plugins
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::dirhistory
zinit snippet OMZP::jsontools
zinit snippet OMZP::z
zinit snippet OMZP::aliases

# Load completions
autoload -U compinit && compinit

# Keybindings
bindkey -v 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=2000
HISTFILE=~/.histfile 
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 

# fzf shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# SHELL editor
export EDITOR=nvim

# Custom alises
alias la="lsd -a1l"
alias cat="bat"
alias ne='nvim'
alias syncdots='cd ~/dotfiles && sh sync_dotfiles.sh'
alias htop='bpytop'


# Bat theme
export BAT_THEME="Nord"

# ssh agent load
alias ssh-l="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/yubi_jc_ed25519"
ssh-l

# Python ruff-lsp
export RUFF_LSP_HOME="/home/jcardenasc93/.local/bin"
export PATH="$PATH:$RUFF_LSP_HOME"

# Go setup
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Elixir
export PATH=$PATH:/usr/bin/elixir

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Custom cmds
# find project
fp() {
  cd $(find ~/Documents -type d -print | fzf) && ne .
}

# nvim config
nconf() {
  cd ~/.config/nvim && ne .
}


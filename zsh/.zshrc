source ${ZDOTDIR:-~}/.antidote/antidote.zsh 
# . $HOME/.asdf/asdf.sh
# append completions to fpath
# fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit 
compinit 
# Lines configured by zsh-newuser-install 
HISTFILE=~/.histfile 
HISTSIZE=1000 
SAVEHIST=1000 
bindkey -v 
# End of lines configured by zsh-newuser-install 
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/jcardenasc93/.zshrc'

# End of lines added by compinstall
 
# source antidote 
# source ${ZDOTDIR:-~}/.antidote/antidote.zsh 
 
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt 
antidote load

# User configuration


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias la="lsd -a1l"

# Bat theme
alias cat="bat"
export BAT_THEME="Nord"

# ssh agent load
alias ssh-l="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/yubi_jc_ed25519"
ssh-l

# Brew Path
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# Python ruff-lsp
export RUFF_LSP_HOME="/home/jcardenasc93/.local/bin"
export PATH="$PATH:$RUFF_LSP_HOME"

# Go setup
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

alias go-cover-html='go test -coverprofile=coverage.out && go tool cover -html=coverage.out'

alias ne='nvim'
alias syncdots='cd ~/dotfiles && sh sync_dotfiles.sh'
alias htop='bpytop'


fp() {
  cd $(find ~/Documents -type d -print | fzf) && ne .
}

nconf() {
  cd ~/.config/nvim && ne .
}

ff() {
  cd ~/ && ne $(rg --files --hidden --follow --glob=\!Library | fzf)

}

eval "$(starship init zsh)"
export EDITOR=nvim

# Elixir
export PATH=$PATH:/usr/bin/elixir

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

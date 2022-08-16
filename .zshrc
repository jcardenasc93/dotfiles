# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git copypath dirhistory history zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="lsd -a"

export PATH="/usr/local/opt/bzip2/bin:$PATH"

# Compilers
#export LDFLAGS="-L/usr/local/opt/zlib/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include"
#export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
#export LDFLAGS="-L/usr/local/opt/readline/lib"
#export CPPFLAGS="-I/usr/local/opt/readline/include"
#export LDFLAGS="-L/usr/local/opt/sqlite/lib"
#export CPPFLAGS="-I/usr/local/opt/sqlite/include"


# Pyenv
# Pyenv conf
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  #eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
eval "$(pyenv init -)"

# Bat theme
export BAT_THEME="gruvbox-dark"

# NVM (Node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

source "/Users/jcardenas/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export SPACESHIP_DIR_TRUNC=1
export SPACESHIP_PROMPT_SYMBOL=''
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_PYENV_COLOR=#8BC34A
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_PYENV_SYMBOL=''
export SPACESHIP_GIT_STATUS_PREFIX='  '
export SPACESHIP_GIT_STATUS_SUFFIX=''
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_PROMPT_DEFAULT_PREFIX=' '
export SPACESHIP_PYENV_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
export SPACESHIP_GIT_BRANCH_COLOR=#8ED1FC
export SPACESHIP_GIT_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
export SPACESHIP_PACKAGE_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
export SPACESHIP_NODE_SHOW=true
export SPACESHIP_NODE_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
export SPACESHIP_NODE_SYMBOL=''
export SPACESHIP_PACKAGE_COLOR=#8BC34A
export SPACESHIP_GOLANG_SYMBOL='ﳑ '

# Go setup
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

alias ne='nvim'
alias syncdots='cd ~/dotfiles && sh sync_dotfiles.sh'

fh() {
local files
  IFS=$'\n' files=($(find ~ | fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ne "${files[@]}"
}

fp() {
local files
  IFS=$'\n' files=($(find ~/Documents | fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ne "${files[@]}"
}

# Watcher (Pinterest)
alias rwatcher='cd ~/code && CODE_PATH=$PWD; TRUNC_PATH=${PWD#"$HOME"/}/; python ~/code/pinboard/bin/watcher.py -s $CODE_PATH jcardenas@devrestricted-jcardenas:$TRUNC_PATH --exclude=/go-cache --exclude=/bin --exclude=/pkg --exclude=/go --exclude=/build --exclude=/manaslib --exclude \*flymake\* --exclude=dev_files --exclude=/tmp --exclude ~/code/pinboard/.#\* --exclude-git --exclude .#\*'

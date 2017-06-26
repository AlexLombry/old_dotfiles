# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/dotfiles

autoload -U promptinit; promptinit
prompt pure

# define the code directory
if [[ -d ~/Code ]]; then
    export CODE_DIR=~/Code
fi

# load all zsh config files
for config ($DOTFILES/zsh/*.zsh) source $config

# Theme
#ZSH_THEME="blinks"
ZSH_THEME="robbyrussell"
#ZSH_THEME=""
#ZSH_THEME="avit"

#plugins=(git brew vagrant composer command-not-found github)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="/Users/alex/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export APP_ENV="mac"

# Base16 Shell
# if [ -z "$THEME" ]; then
#     export THEME="base16-tomorrow"
# fi

# BASE16_SHELL="$DOTFILES/.config/base16-shell/$THEME.$BACKGROUND.sh"

# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# source $BASE16_SHELL

# if [ -z "$BACKGROUND" ]; then
#    export BACKGROUND="dark"
# fi

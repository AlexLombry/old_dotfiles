# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/dotfiles

# define the code directory
if [[ -d ~/Code ]]; then
    export CODE_DIR=~/Code
fi

# load all zsh config files
for config ($DOTFILES/zsh/*.zsh) source $config

# Theme
ZSH_THEME="taybalt"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="/Users/alex/.composer/vendor/bin:$PATH"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/alex/HakShinKen/spark-installer:$PATH"
export PATH="/Users/alex/HakShinKen/installer:$PATH"

export GEM_HOME=$HOME/Software/ruby
export PATH=$PATH:$HOME/Software/ruby/bin

#export GEM_HOME=$HOME/.gem
#export PATH=$GEM_HOME/bin:$PATH

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export APP_ENV="mac"

# export SWIFTENV_ROOT="$HOME/.swiftenv"
# export PATH="$SWIFTENV_ROOT/bin:$PATH"
# eval "$(swiftenv init -)"

#function powerline_precmd() {
#    PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
#}

#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}

# Base16 Shell
if [ -z "$THEME" ]; then
    export THEME="base16-tomorrow"
fi
BASE16_SHELL="$DOTFILES/.config/base16-shell/$THEME.$BACKGROUND.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
source $BASE16_SHELL

if [ -z "$BACKGROUND" ]; then
    export BACKGROUND="dark"
fi
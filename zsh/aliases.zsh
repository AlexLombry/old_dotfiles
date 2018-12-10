# reload zsh config
alias rld='echo "Reloading Zshrc file" && source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

alias zshrc="sublime ~/.zshrc"
alias dot="cd ~/dotfiles; sublime ."

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Applications
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias chrome="/usr/bin/open -a /Applications/Google\ Chrome.app"
alias sublime="/usr/bin/open -a /Applications/Sublime\ Text.app"
alias subl="/usr/bin/open -a /Applications/Sublime\ Text.app"
alias vscode="/usr/bin/open -a /Applications/Visual\ Studio\ Code.app"

# Network
alias webip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Change dock animation
alias killdock="defaults delete com.apple.dock expose-animation-duration; killall Dock"
alias fastdock="defaults write com.apple.dock expose-animation-duration -float 0.01; killall Dock"

alias killmenubar="killall -KILL SystemUIServer"

# Enable/Disable Spotlight
alias spoton="sudo mdutil -a -i on"
alias spotoff="sudo mdutil -a -i off"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Flush Directory Service cache
alias flush="sudo dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Divers
alias loadsshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias restartApache="sudo apachectl restart"
alias etcho="sudo vim /etc/hosts"
alias checkphp="find -L . -name '*.php' -print0 | xargs -0 -n 1 -P 4 php -l"
alias vimrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias :q="exit"

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

# Wi-Fi Commands
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias wificlean="sudo python ~/dotfiles/tools/cleanwifi_macos.py;"
alias wifireboot="networksetup -setairportpower en0 off; networksetup -setairportpower en0 on"
alias wifihardware="networksetup -listallhardwareports"
alias wifiscan="airport scan"
alias wifitake="networksetup -setairportnetwork en0 $1"
alias ssid="airport -I|awk '/^ *SSID/ {print $2}'"
alias iface="networksetup -listallhardwareports|grep -A1 Wi-Fi|awk '/Device:/ {print $2}'"

# iOS
alias simulator="open -a Simulator.app --args -CurrentDeviceUDID $1"
alias list-simulator="xcrun simctl list"

# Unix
alias genpass="pwgen -CsB 26 1 | tr -d ' ' | tr -d '\n' | pbcopy"

alias -s rb=vim
alias -s log="less -MN"
alias -s html="open"
alias -s php=vim

transfer() { 
    if [ $# -eq 0 ]; then 
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; 
        return 1; 
    fi 
    tmpfile=$( mktemp -t transferXXX ); 
    if tty -s; then 
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); 
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; 
    else 
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; 
    fi; 

    echo "\n\n";
    cat $tmpfile; 
    current=$( cat $tmpfile )
    echo "\n\n";

    open -a "Google Chrome" $current;

    rm -f $tmpfile; 
} 

alias transfer=transfer

alias mute="osascript -e 'set volume output muted true'"
alias sup="osascript -e 'set volume 10'"
alias zrsync="rsync -avzhP"
alias httpbench="wrk -t12 -c400 -d30s"

# Show network connections
# Often useful to prefix with SUDO to see more system level network usage
alias network.connections='lsof -l -i +L -R -V'
alias network.established='lsof -l -i +L -R -V | grep ESTABLISHED'
alias network.internalip="ifconfig en0 | egrep -o '([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)'"
alias network.externalip='curl -s http://checkip.dyndns.org/ | sed "s/[a-zA-Z<>/ :]//g"'

# Files used, anywhere on the filesystem
alias files.usage='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep'
# Files being opened
alias files.open='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep|grep open'
# Files in use in the Users directory
alias files.usage.user='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep|grep Users'

alias deletefilerecursive="find . -type f -print0 | xargs -0 rm"
alias sshs="bash ~/dotfiles/tools/ssh-manager.sh"

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias ifconfig-ext='curl ifconfig.me'
alias dss='du -sck * | sort -n'

alias emailgrep='grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b"'
alias t='vendor/bin/phpunit'
alias tf='vendor/bin/phpunit --filter $1'

alias be='bundle exec'

alias bubu="brew update && brew upgrade --all && brew cleanup"
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias bsr="brew services restart $1"

alias co="code ."

alias dkc="docker-compose"
alias dls="docker container ls"
alias dlsa="docker container ls -a"
alias dlsaq="docker container ls -qa"
alias dstpoall="docker container stop $(docker container ls -qa)"
alias drmall="docker container rm $(docker container ls -qa)"

function dshell() {
    (docker container exec -ti $1 bash) || (docker container exec -ti $1 sh);   
}

alias ng-web="ngrok http $1 -subdomain=webapp --region=eu"
alias ng-api="ngrok http $1 -subdomain=webapi --region=eu"
alias ng-lo="ngrok http $1 --subdomain=alombry"

alias tojson="php ~/dotfiles/tools/toJson.php $1"
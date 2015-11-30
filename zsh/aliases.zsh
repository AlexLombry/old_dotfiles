# reload zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

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
alias mou='open -a Mou.app'
alias mark='open -a Marked.app'
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias chrome="/usr/bin/open -a /Applications/Google\ Chrome.app"
alias sublime="/usr/bin/open -a /Applications/Sublime\ Text.app"
alias subl="sublime"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

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
# Launch the screensave, aze because it's easy to type with my keyboard
alias aze="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Divers
alias loadsshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias restartApache="sudo apachectl restart"
alias aliases="cat ~/.aliases | grep -i alias"
alias etcho="sudo vi /etc/hosts"
alias shred="srm -r -m -v"
alias checkphp="find -L . -name '*.php' -print0 | xargs -0 -n 1 -P 4 php -l"
alias flushcache="sudo dscacheutil -flushcache"
alias vimrc="vim ~/.vimrc"
alias ctags="brew --prefix /bin/ctags"
alias :q="exit"

# Directory
alias backend="cd ~/Menus1001/1001backend-dev/"

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

# Wi-Fi Commands
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias wifireboot="networksetup -setairportpower en0 off; networksetup -setairportpower en0 on"
alias wifihardware="networksetup -listallhardwareports"
alias wifiscan="airport scan"
alias wifitake="networksetup -setairportnetwork en0 $1"
alias ssid="airport -I|awk '/^ *SSID/ {print $2}'"
alias iface="networksetup -listallhardwareports|grep -A1 Wi-Fi|awk '/Device:/ {print $2}'"
alias vm="cd ~/Menus1001/Homestead; vagrant ssh;"

# Mysql Aliases
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
alias photoshop="open -a Adobe\ Photoshop\ CC\ 2014 $1"
alias api="cd ~/Code/api.1001menus.io"

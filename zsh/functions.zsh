####################
# functions
####################
# Colors

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function homestead() {
    cd ~/Homestead
    vagrant $*
}

function zenup() {
    cd ~/homestead
    vagrant up
    open -a phpstorm ~/Code/1001backend-dev
    open -a phpstorm ~/Code/api.1001menus.io
}

function zendown() {
    cd ~/homestead
    vagrant halt
    pkill phpstorm
}

function routes()
{
    if [ $# -eq 0 ]; then
        php artisan route:list
    else
        php artisan route:list | grep ${1}
    fi
}

function plex-refresh() {
    ssh dan 'cd "/Applications/Plex Media Server.app/Contents/MacOS/"; ./Plex\ Media\ Scanner -s'
}

function iok() {
    echo -e "\n$COL_GREEN [ok] $COL_RESET "$1
}

function ibot() {
    echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function irunning() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function iaction() {
    echo -e "\n$COL_YELLOW [action]: $COL_RESET\n ⇒ $1..."
}

function iwarn() {
    echo -e "$COL_YELLOW [warning] $COL_RESET "$1
}

function ierror() {
    echo -e "$COL_RED [error] $COL_RESET "$1
}

# Open url with google chrome on mac
function url() {
    open -a google\ chrome "$@"
}

# print available colors and their numbers
function colours() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m colour${i}"
        if (( $i % 5 == 0 )); then
            printf "\n"
        else
            printf "\t"
        fi
    done
}

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

function hist() {
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# find shorthand
function f() {
    find . -name "$1"
}

# get the gps coordinates from a picture
function piclat {
    lat=$(mdls $1 | grep Latitude | awk '{print $3}')
    long=$(mdls $1 | grep Longitude | awk '{print $3}')
    echo Photo was taken at $lat / $long

    echo https://www.google.fr/maps/search/$lat,$long

    if [ -n "$lat" ]; then
        open https://www.google.fr/maps/search/$lat,$long
    fi
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
    mkdir -p "$1"
    git archive master | tar -x -C "$1"
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# All the dig info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    echo # newline
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) rar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function scpp() {
    scp "$1" yourname@yoururl.com:~/your_path/i;
    echo "http://yoururl.com/i/$1" | pbcopy;
}

# syntax highlight the contents of a file or the clipboard and place the result on the clipboard
function hl() {
    if [ -z "$3" ]; then
        src=$( pbpaste )
    else
        src=$( cat $3 )
    fi

    if [ -z "$2" ]; then
        style="moria"
    else
        style="$2"
    fi

    echo $src | highlight -O rtf --syntax $1 --font Inconsoloata --style $style --line-number --font-size 24 | pbcopy
}

# humain more readable size for file and folder
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}

# set the background color to light
function light() {
    export BACKGROUND="light" && reload!
}

function dark() {
    export BACKGROUND="dark" && reload!
}

# open vim more quickly
function v() {
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi;
}

# open gvim more quickly
function vi() {
    if [ $# -eq 0 ]; then
        gvim .;
    else
        gvim "$@";
    fi;
}

# Better tree functionality
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

function laramagic() {
    PROJECT=$1
    cd ~/Web
    laravel new $PROJECT
    cd $PROJECT
    git init
    git add .
    git commit -m "First commit."
    open "http://$PROJECT.dev"
}

function lumenmagic() {
    PROJECT=$1
    cd ~/Web
    lumen new $PROJECT
    cd $PROJECT
    git init
    git add .
    git commit -m "First commit."
    open "http://$PROJECT.dev"
}

#########################################
# From PascalVink
# Utility Functions

# Create a new git repo with one README commit and CD into it
function gitnr() { mkdir $1; cd $1; git init; touch README; git add README; git commit -mFirst-commit;}

# Do a Matrix movie effect of falling characters
function matrix1() {
    echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|gawk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

function matrix2() {
    echo -e "\e[1;40m" ; clear ; characters=$( jot -c 94 33 | tr -d '\n' ) ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) $characters ;sleep 0.05; done|gawk '{ letters=$5; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

# Use Preview to open a man page
function manp() {
    man -t $1 | open -f -a /Applications/Preview.app
}

# Show normally hidden system and dotfile types of files
# in Mac OSX Finder
function showhiddenfiles() {
    defaults write com.apple.Finder AppleShowAllFiles YES
    osascript -e 'tell application "Finder" to quit'
    sleep 0.25
    osascript -e 'tell application "Finder" to activate'
}

# Hide (back to defaults) normally hidden system and dotfile types of files
# in Mac OSX Finder
function hidehiddenfiles() {
    defaults write com.apple.Finder AppleShowAllFiles NO
    osascript -e 'tell application "Finder" to quit'
    sleep 0.25
    osascript -e 'tell application "Finder" to activate'
}

# kill all instances of a process by name
function skill() {
    sudo kill -9 `ps ax | grep $1 | grep -v grep | awk '{print $1}'`
}

function fixperms(){
    find . \( -name "*.sh" -or -type d \) -exec chmod 755 {} \; && find . -type f ! -name "*.sh" -exec chmod 644 {} \;
}

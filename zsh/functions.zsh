####################
# functions
####################
# Colors

function setup_color() {
    # Only use colors if connected to a terminal
    if [ -t 1 ]; then
        ESC_SEQ="\x1b["
        RESET=$ESC_SEQ"39;49;00m"
        RED=$ESC_SEQ"31;01m"
        GREEN=$ESC_SEQ"32;01m"
        YELLOW=$ESC_SEQ"33;01m"
        BLUE=$ESC_SEQ"34;01m"
        MAGENTA=$ESC_SEQ"35;01m"
        CYAN=$ESC_SEQ"36;01m"
    else
        ESC_SEQ=""
        RESET=$ESC_SEQ""
        RED=$ESC_SEQ""
        GREEN=$ESC_SEQ""
        YELLOW=$ESC_SEQ""
        BLUE=$ESC_SEQ""
        MAGENTA=$ESC_SEQ""
        CYAN=$ESC_SEQ""
    fi
}

setup_color

function ok() {
    echo -e "\n$GREEN [ok] $RESET "$1
}

function bot() {
    echo -e "\n$GREEN\[._.]/$RESET - "$1
}

function running() {
    echo -en "\n$YELLOW ⇒ $RESET"$1": "
}

function action() {
    echo -e "\n$YELLOW [action]: $RESET\n ⇒ $1..."
}

function warn() {
    echo -e "\n$YELLOW [warning] $RESET "$1
}

function error() {
    echo -e "$RED [error] $RESET "$1
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
function lats_from_picture {
    lat=$(mdls $1 | grep Latitude | awk '{print $3}')
    long=$(mdls $1 | grep Longitude | awk '{print $3}')
    echo Photo was taken at $lat / $long

    echo https://www.google.fr/maps/search/$lat,$long

    if [ -n "$lat" ]; then
        open https://www.google.fr/maps/search/$lat,$long
    fi
}

# take this repo and copy it to somewhere else minus the .git stuff.
function git-export(){
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

# Better tree functionality
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

#########################################
# From PascalVink
# Utility Functions

# Create a new git repo with one README commit and CD into it
function gitnr() {
    mkdir $1;
    cd $1;
    git init;
    touch README;
    git add README;
    git commit -mFirst-commit;
}

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

# kill all instances of a process by name
function skill() {
    sudo kill -9 `ps ax | grep $1 | grep -v grep | awk '{print $1}'`
}

function fixperms(){
    find . \( -name "*.sh" -or -type d \) -exec chmod 755 {} \; && find . -type f ! -name "*.sh" -exec chmod 644 {} \;
}

function phpserve() {
    if [ $# -eq 1 ]; then
        php -S 0.0.0.0:$1
    else
        php -S 0.0.0.0:8000
    fi
}

function killTouchbar(){
    sudo pkill "Touch Bar agent";
    sudo killall "ControlStrip";
}

# Xcode via @orta
function openx(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

# Go to the root of the current git project, or just go one folder up
function up() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

function compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# Send my public SSH key to another machine
function copysshkey () {
    cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> .ssh/authorized_keys'
}

function cdf() {
    # cd into whatever is the forefront Finder window.
    local path=$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
    echo "$path"
    cd "$path"
}

function duration() {
    ffmpeg -i $1 2>&1 | grep Duration | cut -d ' ' -f 4 | sed s/,//
}

function thumbnail() {
    ffmpeg -i $1 -vframes 1 -an -s 400x225 -ss $2 $3
}

function encode() {
    ffmpeg -y -i $1 -c:v libx264 -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p -movflags +faststart -g 30 -bf 2 -c:a aac -b:a 384k -profile:a aac_low $2
}

function freeport {
  PORT=$1
  PID=`lsof -ti tcp:$PORT`
  if [ -z "$PID"]; then
    echo "No process running on port $PORT"
  else
    kill -KILL $PID
  fi
}

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

function videoduration() {
    find . -type f -exec mediainfo --Inform="General;%Duration%" "{}" \; 2>/dev/null | awk '{s+=$1/1000} END {h=s/3600; s=s%3600; printf "%.2d:%.2d\n", int(h), int(s/60)}'
}

function rename_sf_db() {
    sed -i -- "s/db_user:db_password@127.0.0.1:3306\/db_name/root:root@mysql:3306\/$1/g" .env
}

function sonar() {
    sonar-scanner \
  -Dsonar.projectKey=$1 \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=$2
}

function minimal_php_setup_for_composer() {
    composer require --dev roave/security-advisories:dev-master sebastian/phpcpd phploc/phploc phpstan/phpstan phpmd/phpmd
}

function starter-api-platform()
{
    if [ -z "$1" ]; then
        echo "You must give a folder name (create DB of same name)";
    else
        composer create-project symfony/skeleton $1
        cd $1
        git init
        git add .
        git commit -am "Create Project"
        composer req api annotations migrations
        composer req --dev fzaninotto/faker maker debug orm-fixtures
        composer dump-autoload -o
        sed -i '' "s/db_user:db_password@127.0.0.1:3306\/db_name/root:root@mysql:3306\/$1/g" .env
        #php bin/console doctrine:database:create -e dev --if-not-exists
        rm -rf .env--

        ## MySQL 8 and delete backup file
        sed -i '' "s/'5.7'/'8.0'/g" config/packages/doctrine.yaml
        rm -rf config/packages/doctrine.yaml--

        git add .
        git commit -am "Add first dependencies"

        echo "Launch Symfony Server and create PHPStorm Project"
        symfony serve --no-tls -d
        /usr/local/bin/pstorm .
    fi
}

function updateMac() {
    sudo softwareupdate -i -a
    brew update
    brew upgrade
    brew cleanup
    npm install npm -g
    npm update -g
    sudo gem update --system
    sudo gem update
    sudo gem cleanup
    composer self-update
}

function toMP3() {
    for f in *.ac3; do
        ffmpeg -i "$f" "$f.mp3"
        # /usr/bin/afconvert -d '.mp3' -f MPG3 "$f" -o "$f.mp3"
        echo "$f converted"
    done
}

function gpgenc() {
    CUR_FILE=$1
    gpg --output $CUR_FILE.gpg --encrypt --recipient alex.lombry@gmail.com $CUR_FILE
}

function gpgencwithrecipient() {
    CUR_FILE=$1
    gpg --output $CUR_FILE.gpg --encrypt --recipient $2 $CUR_FILE
}

function gpgdec() {
    CUR_FILE=$1
    STRIP=$(echo $1 | sed 's/.gpg//')
    gpg --output $STRIP --decrypt $CUR_FILE
}

function sslenc() {
    CUR_FILE=$1
    openssl enc -aes-256-cbc -salt -in $CUR_FILE -out $CUR_FILE.enc
}

function ssldec() {
    CUR_FILE=$1
    STRIP=$(echo $1 | sed 's/.enc//')
    openssl enc -d -aes-256-cbc -in $CUR_FILE -out $STRIP
}

function ncx() {
    nc -l -n -vv -p $1 -k
}

function ipinfo() {
    curl http://ipinfo.io/$1
}

function command_exists() {
    command -v "$@" >/dev/null 2>&1
}

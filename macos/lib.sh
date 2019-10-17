#!/usr/bin/env bash
# Colors

ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
CYAN=$ESC_SEQ"36;01m"
MAGENTA=$ESC_SEQ"35;01m"

function ok() {
    echo -e "$GREEN[ok]$RESET "$1
}

function bot() {
    echo -e "\n$GREEN\[._.]/$RESET - "$1"\n"
}

function running() {
    echo -en "$YELLOW ⇒ $RESET"$1": "
}

function action() {
    echo -e "\n$YELLOW[action]:$RESET\n ⇒ $1..."
}

function warn() {
    echo -e "$YELLOW[warning]$RESET "$1
}

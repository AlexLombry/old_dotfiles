# Git
alias ga="git add"
alias gaa="git add ."
alias gccc='git commit -m'
alias gp="git push"
alias gs="git status"
alias gss="git status -sb"

alias git-amend='git commit --amend -C HEAD'
alias git-undo='git reset --soft HEAD~1'
alias git-count='git shortlog -sn'
alias git-undopush="git push -f origin HEAD^:master"
alias nah="git reset --hard; git clean -df;"

function merging() {
    git checkout master
    git pull
    git merge $1
    git push
    git checkout develop
    git pull
    git merge $1
    git push
}

function git_update() {
    git pull
    git checkout develop
    git pull
    git checkout master
}

# Add commit and push all in once
function gsend()
{
    git add .
    git commit -m "$1"
    git push
}

# git root
function give-credit() {
    git commit --amend --author $1 <$2> -C HEAD
}

# a simple git rename file function
# git does not track case-sensitive changes to a filename.
function git-rename() {
    git mv $1 "${2}-"
    git mv "${2}-" $2
}

function g() {
    if [[ $# > 0 ]]; then
        # if there are arguments, send them to git
        git $@
    else
        # otherwise, run git status
        git s
    fi
}

function gf() {
    if [[ $# > 0 ]]; then
        # if there are arguments, send them to git
        git flow $@
    else
        # otherwise, run git status
        git flow log
    fi
}

function git-clean() {
    if [[ $# > 0 ]]; then
        git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | xargs -n 1 git branch -d
    else
        git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop"
    fi
}

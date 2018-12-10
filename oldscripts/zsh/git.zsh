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
alias gcp="git checkout ."
alias git-count-lines="git ls-files | xargs -n1 git blame --line-porcelain | gsed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

# Work in progress
function wip()
{
    git status
    git add .
    git commit -m "Work In Progress"
}

# git root
function git-give-credit() {
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

function git-clean() {
    if [[ $# > 0 ]]; then
        git branch --merged | grep -v "\*" | grep -v "master" | grep -v "dev" | xargs -n 1 git branch -d
    else
        git branch --merged | grep -v "\*" | grep -v "master" | grep -v "dev"
    fi
}

function gf() {
    if [[ $# > 0 ]]; then
        git flow $@
    else
        git flow log
    fi
}

# Rename branches
function git-rename-branch()
{
    git branch -m $1 $2
    git push origin :$1
    git push --set-upstream origin $2
}
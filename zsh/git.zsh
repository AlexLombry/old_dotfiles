# Git
alias nah="git reset --hard; git clean -df;"
alias gs="git status"
alias gss="git status -sb"
alias gccc="git commit -S -m"

alias git-count-lines="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"
alias wip='git status && git add . && git commit -m "Work In Progress"'
alias gpra='git pull --rebase --autostash'

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

# Rename branches
function git-rename-branch()
{
    git branch -m $1 $2
    git push origin :$1
    git push --set-upstream origin $2
}

function git_update() {
    git pull --rebase --autostash
    git checkout develop
    git pull --rebase --autostash
    git checkout master
}

# Add commit and push all in once
function gsend()
{
    git add .
    git commit -m "$1"
    git push
}

function mergeondevelop()
{
    git stash
    git checkout develop
    git pull --rebase --autostash
    git checkout $1
    git rebase develop
    git checkout develop
    git merge $1
}

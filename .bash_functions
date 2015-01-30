# Git Helpers
# Move to master branch and pull latest changes
function upmaster() {
    git checkout master
    branch=`git branch | grep '* master'`
    if [ -n "$branch" ]; then
        git pull origin master
        git fetch
    fi
}

# Move to the current test branch and pull latest changes (monthly naming strategy, ie. 2015-01)
function uptest() {
    year=`date +"%Y"`
    month=`date +"%m"`
    echo git checkout test-$year-$month
    git checkout test-$year-$month
    echo git pull origin test-$year-$month
    git pull origin test-$year-$month
}

# Merge the current branch in the test branch (requires manual confirmation on the final step)
function mergeintest() {
    current=`git symbolic-ref HEAD | cut -d/ -f3-`
    uptest
    echo git merge $current
    git merge $current
}

# Rebase current branch with master to put branch changes on top
function upbranch() {

    git checkout $1
    branch=`git branch | grep "* $1"`
    if [ -n "$branch" ]; then
        git branch
        git rebase master
        git diff master $1 --stat
    fi
}

# Load git completion bash (see https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
if [ -f ~/.git-completion.bash ];
then
    source ~/.git-completion.bash
fi

# Load git prompt bash (see https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
if [ -f ~/.git-prompt.bash ];
then
    source ~/.git-prompt.sh
fi

# Show the current working branch and/or composer version when working on submodule folders
parse_git_branch() {
    composerjson=$(git rev-parse --show-toplevel 2> /dev/null)/composer.json
    aliased_master='' && [ -f $composerjson ] && aliased_master=`sed -e '0,/"extra":\s*{/d' -e '0,/"branch-alias":\s*{/d' -e '/}/,$d' -e "s/.*[\"']dev-master[\"']:\s*[\"']\(.*\)[\"']/\1/" $composerjson | grep '^[[:digit:]]'`
    [ -n "$aliased_master" ] && aliased_master="[$aliased_master]"
    textreset=$(tput sgr0) # reset the foreground colour
    red=$(tput setaf 1)
    blue=$(tput setaf 2)

    # Uncomment this line for coloured display in Unix terminals
    #__git_ps1 "(%s)" | sed -e "s/.\(master.*\)/\x1b[37;41m&$aliased_master\x1b[0m/" -e 's/.\(test.*\)$/\x1b[37;45m&\x1b[0m/' -e 's/.\(demo.*\)$/\x1b[37;44m&\x1b[0m/'
    # Uncomment this line for coloured display in Mac terminals
    __git_ps1 "(%s)" | sed -e "s/.\(master.*\)/${red}&$aliased_master${textreset}/" -e "s/.\(test.*\)$/${blue}&${textreset}/" -e "s/.\(demo.*\)$/${blue}&${textreset}/"
}
PS1="$USER@\[$(tput bold)\]$(hostname -s)\[$(tput sgr0)\] \w \$(parse_git_branch)$ "


# Import a .sql dump file showing a progress bar (requies pv to be installed, and .bash_aliases to be loaded)
function dbimport() {
    pv  $1 | dbdevel
}


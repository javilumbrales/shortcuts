# About
This repository hold aliases and bash functions/helpers that I use on a daily basis as shortcuts to boost my productivity and avoid typing repetitive commands.

Feel free to contribute.

# Requirements

Git Completion & Git Prompt: https://github.com/git/git/tree/master/contrib/completion

# Usage

Make sure your ~/.bashrc (~/.profile on Mac) includes the files with something like:

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

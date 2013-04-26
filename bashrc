# Bail out if not an interactive shell
[ -z "$PS1" ] && return

COMPLETION_DIR=/opt/boxen/homebrew/etc/bash_completion.d

# Source all completion libraries
if [[ -d $COMPLETION_DIR ]]; then
  for file in $(find $COMPLETION_DIR -type l); do
    source $file
  done
fi

# Source the bash-prompt lib
if [[ -f /opt/boxen/repo/modules/people/files/git-prompt.bash ]]; then
  source /opt/boxen/repo/modules/people/files/git-prompt.bash
fi

###############################################################################
# Environment variables                                                       #
###############################################################################

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

# Use a 256-color terminal setting
export TERM=screen-256color

# Change the prompt appearance to include hostname
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"'

export GREP_OPTIONS='--color=auto'
export EDITOR='subl --wait'

# Tell ls to be colorful
export CLICOLOR=1


###############################################################################
# Shell behavior                                                              #
###############################################################################

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append all commands to the history file; don't overwrite it at the start of every new session
shopt -s histappend

# Increase the history file size and set some sane defaults
export HISTSIZE=20000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export HISTCONTROL=ignorespace # Don't store commands beginning with a space


###############################################################################
# Aliases                                                                     #
###############################################################################

# Shortcut for opening sublime from cli
alias subl='open -a "Sublime Text 2"'

# Set helpful ls shortcuts
alias l='ls -al'
alias ll='ls -l'
alias lll='ls -a'

# Alias more to less--I always say more when I mean less ;)
alias more='less'
# Make sure stuff piped through less retains color
alias less='less -R'

# Short Git aliases
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'

# Always use 256-color tmux sessions
alias tmux='tmux -2'


###############################################################################
# Git coloration, completion                                                  #
###############################################################################

# Enable completion for aliases
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gco

# If the git completion library exists, then use its built-in command prompt
if [[ -f ${COMPLETION_DIR}/git-completion.bash ]]; then
  export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '
fi


###############################################################################
# Boxen                                                                       #
###############################################################################

# If it's installed, load the boxen env script
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

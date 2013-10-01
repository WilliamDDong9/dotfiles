# Bail out if not an interactive shell
[ -z "$PS1" ] && return



###############################################################################
# Environment variables                                                       #
###############################################################################

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.dotfiles/bin:$PATH"

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

# Set helpful ls shortcuts
alias l='ls -al'
alias ll='ls -l'
alias lll='ls -a'

# Alias more to less--I always say more when I mean less ;)
alias more='less'
# Make sure stuff piped through less retains color
alias less='less -R'

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


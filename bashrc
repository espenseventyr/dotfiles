# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Set prompt for screen
if [ -z "$PS1" ]; then
   return
fi
PS1='\h:\W \u\$ '

# Paths..., variables...
export PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=/usr/local/bin:/usr/bin:/bin:"$PATH"
#export PATH=~/miniconda3/bin:"$PATH"

export EDITOR=vim
export RI="--format ansi --width 70"
export PAGER="less -R"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE=POSIX
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

# Div
set -o vi

# Aliases
alias t="todo.sh"
alias ll="ls -l"
alias la="ls -a"
alias l="ls -al"
#alias irb="irb --readline -r irb/completion"
#alias m="mvim"
#alias python="python3"
#alias pip="pip3"
alias vi="vim"

# Run keychain
eval `keychain --eval --agents ssh --inherit any myid_rsa`

#Python
export PYENV_ROOT=/usr/local/var/pyenv

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

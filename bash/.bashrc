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

# Read .profile
[[ -r ~/.profile ]] && . ~/.profile

# Use fzf
# Ctrl-r searches bash-history with fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Use ripgrep with fzf
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# Ctrl-T inserts file from fzf into command
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Ctrl-P edits a file in vim from fzf
#bind -x '"\C-p": vim $(fzf);'

# Use autojump
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

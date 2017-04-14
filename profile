# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

# Set prompt for screen
#if [ -z "$PS1" ]; then
#   return
#fi
#PS1='\h:\W \u\$ '

# Paths..., variables...
export PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:"$PATH"
export PATH=/usr/local/texlive/2016basic/bin/x86_64-darwin:"$PATH"
export PATH=~/miniconda3/bin:"$PATH"

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

# Vi-mode
set -o vi

#Python
export PYENV_ROOT=/usr/local/var/pyenv

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

export OPENSSL_INCLUDE_DIR="$(brew --prefix openssl)/include"
export OPENSSL_LIB_DIR="$(brew --prefix openssl)/lib"

#export LDFLAGS:  -L/usr/local/opt/llvm/lib
#export CPPFLAGS: -I/usr/local/opt/llvm/include
#export CC=clang-3.9
#export CXX=clang-3.9

# OPAM configuration
. /Users/espen/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Below, only for interactive shells
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"

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
alias df="df -P"

# Run keychain
eval `keychain --eval --agents ssh --inherit any myid_rsa`

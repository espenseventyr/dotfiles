# For interactive shells: put commands below test for interactive shell.

# Paths..., variables...
export PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:"$PATH"
export PATH=/usr/local/miniconda3/bin:"$PATH" # Breaks compiling homebrew/youcompleteme
#export PATH="$HOME/.cask/bin:$PATH"
export PATH="/usr/local/texlive/2018/bin/x86_64-darwin:$PATH"


export EDITOR=vi
export RI="--format ansi --width 70"
export PAGER="less"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
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

export QT_VERSION=5.8.0
export QT_DIR=$HOME/Qt5.8.0
export QT_STUB=false
export QT_DEBUG=false
export QT_HOMEBREW=true

# Vi-mode
set -o vi

#Python
#export PYENV_ROOT=/usr/local/var/pyenv

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#Go
#export GOPATH=$HOME/go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

# Rust
#export PATH="$HOME/.cargo/bin:$PATH"

#export OPENSSL_INCLUDE_DIR="$(brew --prefix openssl)/include"
#export OPENSSL_LIB_DIR="$(brew --prefix openssl)/lib"

#export LDFLAGS:  -L/usr/local/opt/llvm/lib
#export CPPFLAGS: -I/usr/local/opt/llvm/include
#export CC=clang-3.9
#export CXX=clang-3.9

# OPAM configuration
#. /Users/espen/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Below, only for interactive shells
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export TERM="xterm-256color"
export PS1="\h:\W \u\$ "

# Aliases
alias t="todo.sh"
alias ll="ls -l"
alias la="ls -a"
alias l="ls -al"
#alias irb="irb --readline -r irb/completion"
#alias m="mvim"
#alias python="python2"
#alias pip="pip2"
alias vi="nvim"
alias df="df -P"
alias e="emacsclient"

# Run keychain
#eval `keychain --eval --agents ssh --inherit any myid_rsa`

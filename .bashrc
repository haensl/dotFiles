export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PAGER=/usr/bin/less

set -o vi
set show-mode-in-prompt on

ORANGE='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
GREEN='\[\033[0;32m\]'
NO_COLOR='\[\033[0m\]'
LOCAL_BASH_EXTENSIONS=~/.bashrc.local
ALIAS_FILE=~/.alias
IS_OSX="$(uname -s | grep Darwin)"

if [ $ON_OSX ]; then
  ulimit -n 10480
fi

function dirByDir {
  local depth=$1
  if [ -z $depth ]; then
    depth=2
  fi

  local continuation='…'
  local ppd="${PWD}"
  local i=0
  
  while [ "${ppd}" != '' ]
  do
    ppd="${ppd%/*}"
    let ++i
  done

  if [ $depth -ge $i ]; then
    echo "$PWD"
  else
    local _ppd="${PWD}"
    while [ $i -ge $depth ]
    do
      _ppd="${_ppd#*/}"
      let --i
    done
    echo "$continuation$_ppd"
  fi
}

function branch {
  if [ -d $(pwd)/.git ]; then
    echo " $(git rev-parse --abbrev-ref HEAD)"
  fi
}

export PS1="${ORANGE}\u@\h ${BLUE}\$(dirByDir 3)${NO_COLOR} ${GREEN}\$(branch)${NO_COLOR}\n${BLUE}∞${NO_COLOR} "

test -s $ALIAS_FILE && . $ALIAS_FILE || true
test -s $LOCAL_BASH_EXTENSTIONS && . $LOCAL_BASH_EXTENSIONS || true

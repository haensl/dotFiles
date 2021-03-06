export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PAGER=/usr/bin/less
export LC_CTYPE=C
export LC_ALL=C

set -o vi
set show-mode-in-prompt on

readonly ORANGE='\[\033[0;33m\]'
readonly BLUE='\[\033[0;34m\]'
readonly GREEN='\[\033[0;32m\]'
readonly LIGHT_GRAY='\[\033[0;37m\]'
readonly NO_COLOR='\[\033[0m\]'
readonly LOCAL_BASH_EXTENSIONS=~/.bashrc.local
readonly ALIAS_FILE=~/.alias
readonly IS_OSX="$(uname -s | grep Darwin)"
readonly BASH_COMPLETION_FOLDER=/etc/bash_completion.d/
HISTCONTROL=ignoreboth
HISTSIZE=10000

if [ $IS_OSX ]; then
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
    echo "$continuation/$_ppd"
  fi
}

function branch {
  if [ -d $(pwd)/.git ] && [ -e "$(pwd)/.git/refs/heads/master" ]; then
    echo " $(git rev-parse --abbrev-ref HEAD)"
  fi
}

export PS1="${ORANGE}\u@\h ${BLUE}\$(dirByDir 3)${NO_COLOR} ${GREEN}\$(branch)${NO_COLOR}\n${BLUE}∞${NO_COLOR} "
if [ -d ${BASH_COMPLETION_FOLDER} ]; then
  for i in $(ls ${BASH_COMPLETION_FOLDER});
  do
    source "${BASH_COMPLETION_FOLDER}${i}"
  done
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -s $ALIAS_FILE && . $ALIAS_FILE || true
test -s $LOCAL_BASH_EXTENSIONS && . $LOCAL_BASH_EXTENSIONS || true

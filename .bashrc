export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PAGER=/usr/bin/less

ORANGE='\033[0;33m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

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

PS1="${ORANGE}$USER@${ORANGE}$(hostname) ${BLUE}\$(dirByDir 3)${NO_COLOR} ${GREEN}\$(branch)${NO_COLOR}\n${BLUE}∞${NO_COLOR}"

# Import aliases
test -s ~/.alias && . ~/.alias || true

# Include local extensions if available
LOCAL_EXTENSIONS_FILE=~/.bashrc.local
if [ -e "$LOCAL_EXTENSIONS_FILE" ]; then
  source $LOCAL_EXTENSIONS_FILE
fi

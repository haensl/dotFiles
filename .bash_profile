# VIM 4TW!
export EDITOR=/usr/bin/vim
alias v="vim"

#Setting colors for ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Alias ls
alias ls="ls -la"

# Alias ps
alias ps="ps aux"

# Alias kill
alias kill="kill -s KILL"
alias term="kill -s TERM"

# Alias ping
alias ping="ping -c 3 -v -R"

# Alias overwrite prompt for rm/cp/mv
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias for unix timestamp
alias timestamp='date +%s'

# Alias for git lines of code
alias gitLOC='git ls-files | xargs wc -l'

# Alias to calculate SHA-256
alias sha256="shasum -a 256"

# Alias to calculate SHA-1
alias sha1="shasum -a 1"

# Fix ulimit problem
ulimit -n 10480

# Source local customizations if available
LOCAL_BASH_PROFILE=~/.bash_profile.local
if [ -e "$LOCAL_BASH_PROFILE" ]; then 
  source $LOCAL_BASH_PROFILE 
fi

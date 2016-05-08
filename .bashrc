test -s ~/.alias && . ~/.alias || true

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Alias ls
alias ls="ls -la --color"

# Alias kill
alias kill="kill -s KILL"
alias term="kill -s TERM"

# Alias ping
alias ping="ping -c 3 -v -R"

# Alias overwrite promt for rm/cp/mv
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Alias for unix timestamp
alias timestamp="date +%s"

# Alias for git lines of code
alias gitLOC="git ls-files | xargs wc -l"

alias v="vim"
export EDITOR=/usr/bin/vim

# Alias to calculate SHA-256
alias sha256="shasum -a 256"

# Alias to calculate SHA-1
alias sha1="shasum -a 1"

# Include local extensions if available
LOCAL_EXTENSIONS_FILE=~/.bashrc.local
if [ -e "$LOCAL_EXTENSIONS_FILE" ]; then
  source $LOCAL_EXTENSIONS_FILE
fi
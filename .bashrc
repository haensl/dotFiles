export TERM=xterm-256color
export CLICOLOR=1

# Import aliases
test -s ~/.alias && . ~/.alias || true

# Include local extensions if available
LOCAL_EXTENSIONS_FILE=~/.bashrc.local
if [ -e "$LOCAL_EXTENSIONS_FILE" ]; then
  source $LOCAL_EXTENSIONS_FILE
fi

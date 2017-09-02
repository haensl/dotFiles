BASH_RC=~/.bashrc

test -s $BASH_RC && . $BASH_RC || true
export PATH="/usr/local/sbin:$PATH"

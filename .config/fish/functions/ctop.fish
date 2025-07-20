# Defined in - @ line 1
function ctop --wraps='TERM=(string-replace tmux screen $TERM) /usr/bin/ctop' --wraps='TERM=${TERM/#tmux/screen} ctop' --wraps='TERM=${TERM/#tmux/screen} /usr/bin/ctop' --wraps='TERM=screen-256color /usr/bin/ctop' --description 'alias ctop=TERM=screen-256color /usr/bin/ctop'
  TERM=screen-256color /usr/bin/ctop $argv;
end

if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

export EDITOR=`which vim`
export GREP_OPTIONS='--color=auto'

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad


if [ -f "$HOME/.inputrc" ]; then
  export INPUTRC="$HOME/.inputrc"
fi 

if [ -f /opt/facebook/hg/share/scm-prompt.sh ]; then
  source /opt/facebook/hg/share/scm-prompt.sh
fi

# Using magenta (95) on laptop, to be able to distinguish between this 
# and devserver
export PS1='$?|[\[\033[36m\]\u\[\033[m\]@\[\033[95m\]\h\[\033[m\]]:\[\033[33;1m\]\W\[\033[m\]$(_scm_prompt)\$ '

export DEVSERVER=devvm2682.lla2.facebook.com
alias etdev="et $USER@$DEVSERVER:8087"

alias ll='ls -alF'
alias fbc="cd ${HOME}/fbsource/fbcode"

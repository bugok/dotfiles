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

# Using different text colors for different OSs to have a quicker indication 
# about the machine I'm working on
_hostname_color() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    builtin printf '\033[95m'  # magenta
  else
    builtin printf '\033[32m'  # green
  fi
}

export PS1='$?|[\[\033[36m\]\u\[\033[m\]@$(_hostname_color)\h\[\033[m\]]:\[\033[33;1m\]\W\[\033[m\]$(_scm_prompt)\$ '

export DEVSERVER=devvm2682.lla2.facebook.com
alias etdev="et $USER@$DEVSERVER:8087"

alias ll='ls -alF'
alias fbc="cd ${HOME}/fbsource/fbcode"

# Add JDK
export PATH="/usr/local/opt/openjdk/bin:$PATH"

alias vpnoff='/opt/cisco/anyconnect/bin/vpn disconnect'
alias vpnkill='echo for the love of god; sudo pkill -f vpn'
alias vpnon='/opt/cisco/anyconnect/bin/vpn connect "EMEA"'
alias vpnstatus='/opt/cisco/anyconnect/bin/vpn state'


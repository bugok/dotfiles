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

if [ -f /opt/facebook/hg/share/scm-prompt ]; then
  source /opt/facebook/hg/share/scm-prompt
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

export PS1='$?|[\[\033[36m\]\u\[\033[m\]@\[$(_hostname_color)\]\h\[\033[m\]]:\[\033[33;1m\]\w\[\033[m\]$(_scm_prompt)\$ '

export OLD_DEVSERVER=devvm4145.lla0.facebook.com
export DEVSERVER=devvm27798.lla0.facebook.com

# With vpn
# alias etdev="et $USER@$DEVSERVER:8080"

# Without vpn
alias etdev="/usr/local/bin/x2ssh -et $DEVSERVER -c 'tmux -CC new -A -s dev'"


alias ll='ls -alF'
alias fbc="cd ${HOME}/fbsource/fbcode"

# Add JDK, gem
export PATH="/usr/local/opt/openjdk/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:$HOME/bin"

# Add go stuff
export PATH="$PATH:$HOME/go/bin/"

# Add node
# After running 'npm config set prefix=$HOME/node'
export PATH="$PATH:$HOME/node/bin"

# Add Android tools
export PATH="$PATH:/Users/$USER/Library/Android/sdk/platform-tools"

export VPN_CLIENT="/opt/cisco/secureclient/bin/vpn"
alias vpnoff="${VPN_CLIENT} disconnect"
alias vpnkill='echo for the love of god; sudo pkill -f vpn'
alias vpnon="${VPN_CLIENT} connect \"EMEA\""
alias vpnstatus="${VPN_CLIENT} state"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

if [ -f $HOME/scripts/scm-prompt.sh ]; then
  source $HOME/scripts/scm-prompt.sh
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

export OLD_DEVSERVER=devbig079.cln2.facebook.com
export DEVSERVER=devbig887.lla2.facebook.com
export DEVSERVER64=devvm24535.cln0.facebook.com

# With vpn
# alias etdev="et $USER@$DEVSERVER:8080"

# Without vpn
alias etdev="/usr/local/bin/x2ssh -et $DEVSERVER -c 'tmux -CC new -A -s dev'"
alias etdev64="/usr/local/bin/x2ssh -et $DEVSERVER64 -c 'tmux -CC new -A -s dev'"


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

# Add homebrew
export PATH="$PATH:/opt/homebrew/bin/"

export VPN_CLIENT="/opt/cisco/secureclient/bin/vpn"
alias vpnoff="${VPN_CLIENT} disconnect"
alias vpnkill='echo for the love of god; sudo pkill -f vpn'
alias vpnon="${VPN_CLIENT} connect \"EMEA\""
alias vpnstatus="${VPN_CLIENT} state"

# This is how to add fzf support after installing fzf using homebrew
eval "$(fzf --bash)"

# Set locale to en_US
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

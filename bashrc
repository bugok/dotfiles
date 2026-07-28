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

# show worktree information in scm_prompt:  
# https://noamlerner.com/posts/worktree_scm_prompt/
export SCM_PROMPT_SHOW_WORKTREE=1 

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

# Suppress zsh is the default shell on mac
# https://apple.stackexchange.com/a/371998
export BASH_SILENCE_DEPRECATION_WARNING=1

# Without vpn
alias etdev="/usr/local/bin/x2ssh -et $DEVSERVER -c 'tmux -CC new -AD -s dev'"

# Connect to on-demand with tmux
alias dev_od="dev connect --type www_fbsource_configerator -- tmux -CC new -A -s main"

# Reconnect to the tmux session ("main") on the OD reserved via the dev_od alias.
reconnect_od() {
    local type="www_fbsource_configerator"

    local host
    host=$(dev list 2>/dev/null | awk -v t="$type" '$0 ~ t && $1 ~ /\.od$/ {print $1; exit}')

    if [[ -z "$host" ]]; then
        echo "reconnect_od: no '$type' on-demand found in 'dev list'." >&2
        echo "               reserve one first with: dev_od" >&2
        return 1
    fi

    echo "reconnect_od: reconnecting to $host (tmux session: main)..." >&2
    # -n <host> targets the existing OD; tmux 'new -A -s main' attaches if the
    # session exists, else creates it. Mirrors the dev_od alias.
    dev connect -n "$host" -- tmux -CC new -A -s main
}

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

# FBLite Unity dev-loop helpers (lite-rebuild, lite-rerun, lite-reunite, lite-log, ...)
if [ -f "$HOME/fbsource/fbcode/fblite/unity/scripts/od_utils_functions.sh" ]; then
  source "$HOME/fbsource/fbcode/fblite/unity/scripts/od_utils_functions.sh"
  # the script turns on errexit/nounset, which are hostile to interactive shells; undo them
  set +o errexit; set +o nounset
fi


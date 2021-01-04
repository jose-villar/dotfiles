# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# Vi mode #JOSE
bindkey -v

export KEYTIMEOUT=1
# Show different colors for files and directories
alias ls='ls --color=auto'

alias t='tmux'

alias whatsmyip='wget http://ipecho.net/plain -O - -q ; echo'

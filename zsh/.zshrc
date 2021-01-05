# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jose/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Theme
source ~/.dotfiles/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias ls="ls --color=auto"
alias q="exit"
alias t="tmux"
alias whatsmyip="wget http://ipecho.net/plain -O - -q ; echo"

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Other plugins
source ~/.dotfiles/zsh/other-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Must be at the end of the file
source ~/.dotfiles/zsh/other-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

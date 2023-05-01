# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin:/home/jon/.local/bin
export PATH=$PATH:/usr/local/bin/dart-sass

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

# Pakk
export PAKK_ENV="clouddev"
export PAKK_SERVER_NAME="pakk.store"
export PORT=3000
export PAKK_NODE="jon-dev"

# Go
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin

# NPM
export PATH="$PATH:$NPM_PACKAGES/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
case `uname` in
  Darwin)
	  alias vim="nvim"
	  alias v="nvim"
	  alias vimcfg="nvim ~/.config/nvim/init.vim"
	  alias zshcfg="nvim ~/.zshrc"
	  alias tmuxcfg="nvim ~/.tmux.conf"
	  export VISUAL=nvim
	  export EDITOR="nvim"
  ;;
  Linux)
	  alias vim="nvim"
	  alias v="nvim"
	  alias vimcfg="nvim ~/.config/nvim/init.vim"
	  alias zshcfg="nvim ~/.zshrc"
	  alias tmuxcfg="nvim ~/.tmux.conf"
	  export VISUAL=nvim
	  export EDITOR="nvim"
  ;;
esac

alias mykill="pkill -u $USER"
alias pakk="cd ~/src/github.com/dogpakk/pakk"
alias gotestfunc="go test -run"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Use starship as prompt
# eval "$(starship init zsh)"

# npm
export PATH=~/.npm-global/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#

#Terminal Settings
export COLORTERM=truecolor
# Seens that the TERM needs to be xterm rather than tmux else it starts repeating commands with a %
export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PAKK_SCRIPT_API='https://tapaslunch-clouddev.pakk.io:3010/adminapi'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jon/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jon/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jon/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jon/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

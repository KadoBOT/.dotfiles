# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/Projects/telescope-spotify.nvim/go:$PATH # FIX: temporary
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export BROWSER=brave
export SESSION_BUS_SOCKET=/tmp/dbus/$USER.session.usock
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export TERM=alacritty-direct

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
KUBE_EDITOR="vim"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

setopt globdots
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    # docker
    # docker-compose
    # gcloud
    # kubectl
    # minikube
    # helm
    common-aliases
    terraform
    aws
    vi-mode
    tmux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh= "vim ~/.oh-my-zsh"
alias cat="bat"
alias ls="exa --icons"
alias ll="exa --header --long --icons"
#alias mk="minikube"
#alias k="kubectl"
alias ka="k apply"
alias kaf="ka -f"
alias kc="k create"
alias kcf="kc -f"
alias kg="k get"
alias kdl="k delete"
alias kds="k describe"
#alias tf="terraform"
alias n="nvim"
alias vi="nvim"
alias vim="nvim"
alias oldvim="\vim"
alias cdp="cd ~/Projects"
alias cdd="cd ~/.dotfiles"

# Paths
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$PATH:$HOME/.pulumi/bin
# export PATH=$PATH:$HOME/.istio/bin
# export PATH=$PATH:$HOME/.emacs.d/bin
# export PATH=$PATH:/usr/local/share/webOS_TV_SDK/CLI/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias luamake=/Users/ricardoambrogi/Projects/lua-language-server/3rd/luamake/luamake

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ricardoambrogi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ricardoambrogi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ricardoambrogi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ricardoambrogi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

eval $(thefuck --alias)

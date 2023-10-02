set PATH $PATH $HOME/bin:/usr/local/bin
set PATH $PATH $HOME/Library/Python/3.9/bin
set PATH $PATH $GOPATH/bin

set FZF_DEFAULT_COMMAND 'fd --type f'
set GOPATH ~/go
set TERM alacritty-direct
set -g theme_nerd_fonts yes
set -g theme_color_scheme nord

alias n="nvim"
alias vi="nvim"
alias vim="nvim"
alias oldvim="\vim"
alias cdp="cd ~/Projects"
alias cdd="cd ~/.dotfiles"
alias luamake=/Users/ricardoambrogi/Projects/lua-language-server/3rd/luamake/luamake

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/kadobot/miniconda3/bin/conda
    eval /Users/kadobot/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


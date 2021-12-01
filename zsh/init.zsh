source ~/zsh/theme.zsh 

alias vim="nvim"
alias myip="curl http://ipecho.net/plain; echo"
alias rm="trash"
alias gs="git status"
alias gd="git diff"
alias gbr="git branch"
alias pip="pip3"
alias python="python3"
alias gc="git clone"
alias c="clear"
alias ls="logo-ls -A -D"
alias l="logo-ls -A -D"
alias s="logo-ls -A -D"
alias cls="c;ls"
alias v="vim"
alias vrc="vim ~/.config/nvim/init.lua"
alias zrc="cd ~/zsh;vim ~/zsh/init.zsh"
alias pdf="open -a Preview "
alias yarn="y"
alias yr="yarn run"
alias ya="yarn add"
alias yd="yarn run dev"
alias fresh="c; echo "" ;unowns.py"
alias gs="git status"
alias gd="git diff"
alias gbr="git branch"
alias gc="git clone"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --date=short"
alias t=tmux

source ~/zsh/antigen.zsh

function push() {
    git add .
    git commit -a -m "$1"
    git push
}

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
antigen apply

bindkey -v # vi-mode

source ~/zsh/completion.zsh

macchina


function updateDots() {
    cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2/
    cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/alacritty/alacritty.yml
    cp ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf
    rsync -rv ~/zsh ~/.dotfiles
    rsync -rv ~/.config/fish ~/.dotfiles
    rsync -rv ~/.config/kitty ~/.dotfiles
    rsync -rv ~/.config/zathura/ ~/.dotfiles/zathura
}

source $HOME/.cargo/env
export PATH=/Users/sam/.node_modules/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"

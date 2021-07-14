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
source ~/antigen.zsh

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

pfetch


function updateDots() {
  rsync -rv --exclude=plugged ~/.config/nvim ~/.dotfiles/
  cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2
  cp -R ~/zsh ~/.dotfiles
}

source $HOME/.cargo/env
export PATH=/Users/sam/.node_modules/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"

autoload -U promptinit; promptinit
prompt pure

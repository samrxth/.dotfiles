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
alias cls="c;ls"
alias v="vim"
alias vrc="vim ~/.config/nvim/init.vim"
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
antigen apply


autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%} $%b "

macchina


source ~/zsh/completion.zsh
source ~/zsh/bindings.zsh


function updateDots() {
  rsync -rv --exclude=plugged ~/.config/nvim ~/.dotfiles/
  cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2
  cp -R ~/zsh ~/.dotfiles
}

source $HOME/.cargo/env

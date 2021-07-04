alias myip="curl http://ipecho.net/plain; echo"
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
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
alias vrc="vim ~/.vim/init.vim"
alias zrc="cd zsh;vim ~/zsh/init.zsh"
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


export PATH=~/.cargo/bin:$PATH

function updateDots() {
  cp ~/.vim/coc-settings.json ~/.dotfiles/vim
  cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2
  cp -R ~/.vim/conf ~/.dotfiles/vim/
  cp -R ~/zsh ~/.dotfiles
}

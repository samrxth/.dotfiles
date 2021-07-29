alias c "clear"

alias pip "pip3"
alias python "python3"

alias rm "trash"

alias vim "nvim"
alias v "vim"
alias fn "rm -rf ~/.local/share/nvim/swap"

alias ls "logo-ls -A -D"
alias ll "ls"
alias l "ls"

alias gs "git status"
alias gd "git diff"
alias gbr "git branch"
alias gc "git clone"

alias vrc "vim ~/.config/nvim/init.lua"
alias frc "vim ~/.config/fish/config.fish"

function push
    git add .
    git commit -m $argv
    git push
end
funcsave push

function updateDots
    cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2/
    cp ~/.config/fish/config.fish ~/.dotfiles/fish
end
funcsave updateDots
    
function mkcd
  mkdir $argv
  cd $argv
end
funcsave mkcd

function tv
  touch $argv
  vim $argv
end
funcsave tv

fish_vi_key_bindings

set -x GOPATH /users/sam/go

alias c "clear"

alias postgresServer "/opt/homebrew/opt/postgresql@13/bin/postgres -D /opt/homebrew/var/postgresql@13"

alias diskCheck "smartctl -a disk0 | grep \"Percentage Used\""

alias pip "pip3"
alias python "python3"

alias rm "trash"

alias vim "nvim"
alias v "vim"
alias fn "rm -rf ~/.local/share/nvim/swap"

alias lg "lazygit"

alias ls "logo-ls -A -D"
alias ll "ls"
alias l "ls"
alias s "ls"
alias sl "ls"
alias cls "c;echo ""; echo "" ;ls"
alias cl "c;echo ""; echo "" ;ls"

alias y "yarn"
alias yr "yarn run"
alias ya "yarn add"
alias yd "yarn remove"

alias fresh "c; echo "" ;unowns.py"

alias gs "git status"
alias gd "git diff"
alias gbr "git branch"
alias gc "git clone"
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --date=short"

alias vrc "vim ~/.config/nvim/init.lua"
alias frc "vim ~/.config/fish/config.fish"

alias vf "vim (\"fzf\")"

alias za "nohup zathura & exit"

alias t "tmux"
alias tmuxReload "tmux source-file ~/.tmux.conf"

function push
  git add .
  git commit -m $argv
  git push
end
funcsave push

function updateDots
  cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2/
  cp ~/.config/fish/config.fish ~/.dotfiles/fish
  cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/alacritty/alacritty.yml
  rsync -rv ~/.config/kitty ~/.dotfiles
  cp ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf
  rsync -rv ~/.config/zathura/ ~/.dotfiles/zathura
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

function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end
funcsave removepath

function fish_greeting
end

function addpaths
  set -U fish_user_paths $argv $fish_user_paths
end
funcsave addpaths

function export
    if [ $argv ] 
        set var (echo $argv | cut -f1 -d=)
        set val (echo $argv | cut -f2 -d=)
        set -g -x $var $val
    else
        echo 'export var=value'
    end
end
funcsave export

export GOPATH=/users/sam/go
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path /opt/homebrew/opt/python@3.8/bin

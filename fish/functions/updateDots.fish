function updateDots
    cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2/
    cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/alacritty/alacritty.yml
    cp ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf
    rsync -rv ~/zsh ~/.dotfiles
    rsync -rv ~/.config/nvim ~/.dotfiles
    rsync -rv ~/.config/discocss ~/.dotfiles
    rsync -rv ~/.config/fish ~/.dotfiles
    rsync -rv ~/.config/kitty ~/.dotfiles
    rsync -rv ~/.config/zathura/ ~/.dotfiles/zathura
    rsync -rv ~/BACKGROUNDS ~/.dotfiles/backgrounds
end

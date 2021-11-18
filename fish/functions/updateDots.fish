function updateDots
    cp ~/.config/iterm2/com.googlecode.iterm2.plist ~/.dotfiles/iterm2/
    rsync -rv ~/.config/fish ~/.dotfiles
    cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/alacritty/alacritty.yml
    rsync -rv ~/.config/kitty ~/.dotfiles
    cp ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf
    rsync -rv ~/.config/zathura/ ~/.dotfiles/zathura
end

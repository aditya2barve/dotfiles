#!/bin/bash

echo "
# adding dotfiles
source ~/repos/dotfiles/bashrc
" >> ~/.bashrc

ln -s ~/repos/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.vim/colors/
ln -s ~/repos/dotfiles/gruvbox.vim ~/.vim/colors/gruvbox.vim

# configure vimdiff as git difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false

# install bat
# download latest release from https://github.com/sharkdp/bat/releases
# sudo dpkg -i bat*amd64.deb (for desktop)

# install ripgrep
# sudo apt-get install ripgrep

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc --no-zsh --no-fish

# install fzf for vim
git clone --depth 1 https://github.com/junegunn/fzf.vim ~/.vim/pack/vendor/start/fzf.vim

echo "setup complete!"


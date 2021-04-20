#!/bin/bash

echo "
# adding dotfiles
source ~/repos/dotfiles/bashrc
" >> ~/.bashrc

ln -s ~/repos/dotfiles/vimrc ~/.vimrc
ln -s ~/repos/dotfiles/gruvbox.vim ~/.vim/colors/gruvbox.vim

# configure vimdiff as git difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false

echo "setup complete!"


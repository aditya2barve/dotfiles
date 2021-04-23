#!/bin/bash

source_command="source ~/repos/dotfiles/bashrc"
if [ $(grep -cx "$source_command" ~/.bashrc) -eq 0 ]; then
    echo "$source_command" >> ~/.bashrc
    echo "added to ~/.bashrc: '$source_command'"
else
    echo "already exists in ~/.bashrc: '$source_command'"
fi

ln -s ~/repos/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.vim/colors/
ln -s ~/repos/dotfiles/gruvbox.vim ~/.vim/colors/gruvbox.vim

# vim snippets
ln -s ~/repos/dotfiles/snippets ~/.vim/

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

# install surround.vim
git clone https://tpope.io/vim/surround.git ~/.vim/pack/vendor/start/surround
vim -u NONE -c "helptags surround/doc" -c q

# install commentary.vim
git clone https://tpope.io/vim/commentary.git ~/.vim/pack/vendor/start/commentary
vim -u NONE -c "helptags commentary/doc" -c q

# install repeat.vim
git clone https://tpope.io/vim/repeat.git ~/.vim/pack/vendor/start/repeat

echo "setup complete!"


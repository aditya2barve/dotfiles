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

# my vim snippets
ln -s ~/repos/dotfiles/my-snippets ~/.vim/

# configure vimdiff as git difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false

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

# install ReplaceWithRegister
git clone https://github.com/vim-scripts/ReplaceWithRegister.git ~/.vim/pack/vendor/start/ReplaceWithRegister

# install coc.nvim
git clone https://github.com/neoclide/coc.nvim.git ~/.vim/pack/vendor/start/coc.nvim

# link coc settings
ln -s ~/repos/dotfiles/coc-settings.json ~/.vim/

# install python3 syntax highlighting
mkdir -p ~/.vim/syntax
curl "https://raw.githubusercontent.com/vim-python/python-syntax/master/syntax/python.vim" -o ~/.vim/syntax/python.vim

# install AutoClose for vim
git clone https://github.com/vim-scripts/AutoClose.git ~/.vim/pack/vendor/start/AutoClose

# install clever-f.vim
git clone https://github.com/rhysd/clever-f.vim.git ~/.vim/pack/vendor/start/clever-f.vim

# teach vim to recognize Dockerfiles
git clone https://github.com/ekalinin/Dockerfile.vim.git
cd Dockerfile.vim
make install
cd ..
rm -rf Dockerfile.vim

# create config if not exists
config=$REPOS_DIR/dotfiles/config.sh
[ -f $config ] || echo "GIT_HOSTING_SERVICE=GitHub # GitHub | AzureDevOps" > $config

# install autojump
git clone git://github.com/wting/autojump.git $REPOS_DIR/autojump
cd $REPOS_DIR/autojump
./install.py
cd -

echo "setup complete!"

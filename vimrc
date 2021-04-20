syntax on
set number
set relativenumber

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround

" https://github.com/tomasiser/vim-code-dark
colorscheme codedark

let mapleader = " "
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap Q <nop>

iabbrev @@ aditya2barve@gmail.com

" enclose visual selection
vnoremap ' di''<esc>P
vnoremap " di""<esc>P
vnoremap ( di()<esc>P
vnoremap { di{}<esc>P
vnoremap < di<><esc>P

" comment and uncomment visual selection
autocmd FileType vim vnoremap / :norm 0i" <cr>gv
autocmd FileType python vnoremap / :norm 0i# <cr>gv
vnoremap x :norm 0x"<cr>gv


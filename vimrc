syntax on
set number
set relativenumber

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround

" theme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark

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
autocmd FileType vim vnoremap / :norm I" <cr>gv
autocmd FileType python vnoremap / :norm I# <cr>gv
vnoremap x :norm 0x"<cr>gv

" highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" add colors for vimdiff
hi DiffAdd      ctermfg=Green ctermbg=NONE
hi DiffDelete   ctermfg=Red ctermbg=NONE
hi DiffChange   ctermfg=DarkGray ctermbg=NONE
hi DiffText     ctermfg=Yellow ctermbg=NONE

set splitright
set splitbelow


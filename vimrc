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
set scrolloff=8

set rtp+=~/.fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :Rg<cr>

" change window focus
nnoremap <leader>h <c-w><c-h>
nnoremap <leader>j <c-w><c-j>
nnoremap <leader>k <c-w><c-k>
nnoremap <leader>l <c-w><c-l>

" folding support
set foldmethod=indent
set foldnestmax=2
nnoremap z0  :set foldlevel=0<CR><Esc>
nnoremap z1  :set foldlevel=1<CR><Esc>
nnoremap z2  :set foldlevel=2<CR><Esc>
nnoremap z9  :set foldlevel=9<CR><Esc>

" terminal commands
nnoremap <leader>t :vert ter<cr>
tnoremap <esc> <c-w>N

" snippets
let maplocalleader=","
nnoremap <localleader>html
    \ :-1read ~/.vim/snippets/html/skeleton.txt<cr>jf<;i
nnoremap <localleader>def
    \ :-1read ~/.vim/snippets/python/function.txt<cr>wcw
nnoremap <localleader>main
    \ :-1read ~/.vim/snippets/python/main.txt<cr>


syntax on
set number
set relativenumber

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround
set smartindent
set backspace=indent,eol,start  " more powerful backspacing

" theme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

let mapleader = " "
nnoremap <leader>ev :call OpenVimrc()<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap Q <nop>

iabbrev @@ aditya2barve@gmail.com

" enclose visual selection
vnoremap ' di''<esc>P
vnoremap " di""<esc>P
vnoremap ( di()<esc>P
vnoremap { di{}<esc>P

" comment and uncomment visual selection
autocmd FileType vim setlocal commentstring=\"%s
autocmd FileType bash,python,sh setlocal commentstring=#%s

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
nnoremap <leader>t :call OpenTerminal()<cr>
tnoremap <esc> <c-w>N

" snippets
let maplocalleader=","
nnoremap <localleader>html
    \ :-1read ~/.vim/my-snippets/html/skeleton.txt<cr>jf<;i
nnoremap <localleader>def
    \ :-1read ~/.vim/my-snippets/python/function.txt<cr>wcw
nnoremap <localleader>main
    \ :-1read ~/.vim/my-snippets/python/main.txt<cr>

"search
set hlsearch
set incsearch
nnoremap // :noh<cr>

" Coc commands start ==========================================================================
" taken from: https://github.com/neoclide/coc.nvim#example-vim-configuration

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc commands end ==========================================================================

let g:python_highlight_all = 1


" open link under cursor on MacOS
" reference: https://github.com/vim/vim/issues/4738#issuecomment-714609892
if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif

function! SmartSplit()
  if winwidth('%') > 100
    execute "vsplit"
  else
    execute "split"
  endif
endfunction

function! OpenTerminal()
  call SmartSplit()
  execute "term ++curwin"
endfunction

function! OpenVimrc()
  call SmartSplit()
  execute "e" $MYVIMRC
endfunction

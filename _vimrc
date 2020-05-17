"""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'posva/vim-vue'
Plug 'severin-lemaignan/vim-minimap'
Plug 'djoshea/vim-autoread'
Plug 'slim-template/vim-slim'
Plug 'ryanoasis/vim-devicons'
Plug 'qpkorr/vim-bufkill'
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
"""""""""""""""""""""""""""

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Disable bells
autocmd! GUIEnter * set vb t_vb=

" Set encoding
set encoding=utf8

" Set gui option
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions=    "scrollbar

" Do not make vim compatible with vi.
set nocompatible

" Do not create .swp files
set noswapfile

" Number the lines.
set number

" Show auto complete menus.
set wildmenu

" Make wildmenu behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest

" Enable mouse pointing
set mouse=a

" ALWAYS spaces
set expandtab

" Fix backspace behavior 
set backspace=indent,eol,start

" Use system clipboard 
set clipboard+=unnamed

" Keep Undo history on buffer change
set hidden

" Reload files after change on Disk
"set autoread
"au CursorHold * checktime

" Turn on syntax hightlighting.
set syntax=on
set nowrap
set tabstop=4
set shiftwidth=4
set nocindent

" Speed optimization
set ttyfast
set lazyredraw

" Theme
set background=dark
set termguicolors
colorscheme quantum
set guifont=FuraCode\ Nerd\ Font:h9

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0

" Airline
set laststatus=2
let g:statline_syntastic=0
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

" Indent Guides
let g:indentLine_enabled=1
let g:indentLine_color_term=235
let g:indentLine_char='┆'

" Chain vimgrep and copen
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END

" Change cursor appearance depending on the current mode
let &t_SI ="\e[5 q" "SI = INSERT mode
let &t_SR ="\e[4 q" "SR = REPLACE mode
let &t_EI ="\e[1 q" "EI = NORMAL mode (ELSE)

""""""""""""""""""""""""""
" Custom bindings
""""""""""""""""""""""""""

" Browse airline tabs
:nnoremap <C-p> :bnext<CR>
:nnoremap <C-o> :bprevious<CR>

" Toggle Nerdtree
noremap <silent> <C-f> ::NERDTreeToggle<CR>

" Select all
noremap <C-a> <esc>ggVG<CR>

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind | wincmd w"
    else
      exe ":NERDTreeToggle | wincmd w"
    endif
  endif
endfunction

" Adding automation for when entering or leaving Vim
au VimLeave * NERDTreeClose

autocmd VimEnter * :silent! bufdo e
set sessionoptions-=options  " Don't save options

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :call NERDTreeToggleInCurDir() | endif
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

set fillchars+=vert:\|
set shell=bash
autocmd BufEnter * silent! lcd %:p:h
let g:airline#extensions#ale#enabled=1
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'
let g:ale_sign_column_always=1

let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let g:WebDevIconsUnicodeDecorateFileNodes=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
let g:NERDTreeHighlightFolders=1
let g:NERDTreeHighlightFoldersFullName=1

let g:ctrlp_working_path_mode=0

" Set autoindent
set ai
set si

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_map = '<C-m>'
let g:ctrlp_cmd = 'CtrlP'

"----------- Searching ---------------------
set hlsearch
set incsearch


" The default leder key is ','
" Leader is used as a namespace to 
" prevent overwrite existing mapping
let mapleader = ','


"----------- Custom Mapping ----------------

" Copy/paste from system register
noremap <C-y> "*y
noremap <C-p> "*p
noremap <C-y> "+y
noremap <C-p> "+p

" Window navigation
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Move cursor 5 line to top or bottom
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k


" Alias for esc
inoremap kj <Esc>
vnoremap kj <Esc>
inoremap kl <Esc>A

" Start Minimap
" autocmd VimEnter * Minimap

" Close current buffer
map <C-x> :BD<cr>

" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>

" Comment block
vnoremap <silent> <C-/> :Commentary<cr>
nnoremap <silent> <C-/> :Commentary<cr>

" Shortcut to edit vimrc
noremap <Leader>ev :tabedit $MYVIMRC<cr>

" Turn off search highlight
noremap <Leader><space> :nohlsearch<cr>


"------------- Auto Command -----------------

"Automatically source vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost _vimrc source %
augroup END
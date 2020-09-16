set nocompatible              " Be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'preservim/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'wincent/terminus'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'qpkorr/vim-bufkill'

call vundle#end()            " required
filetype plugin indent on    " required

" Disable help text on NERDTree
let NERDTreeMinimalUI=1

set noeol

" Enable syntax highlighting
syntax enable

" Disable text wrap
set nowrap

" Set tab size to 4 spaces
set tabstop=4

" Enable indent using tab
set shiftwidth=4

" Disable annoying bell
set noerrorbells visualbell t_vb=

" Always show tab
set showtabline=2

colorscheme desert

" Configure vim backspace to behave like normal editor
set backspace=indent,eol,start

" Activate line number
set number

" Do not create .swp files
set noswapfile

" Change the default <Leader> from backslash (\) to a comma (,)
let mapleader = ','



"-----------------------------------
"              Visuals             "
"-----------------------------------

" Set color scheme
colorscheme atom-dark

" Set line space
set linespace=13

" Set gui font
set guifont=FuraCode_Nerd_Font:h9

" Set gui options
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

" Set line number background
hi LineNr guibg=bg

" Set vertical split background
hi vertsplit guifg=bg guibg=white

" Set to not show full path on tab
set guitablabel=%t

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1


"-----------------------------------
"     Split Management             "
"-----------------------------------

" Open vertical split to the bottom of current buffer
set splitbelow

" Open horizontal split to the right of current buffer
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>



"-----------------------------------
"     Buffer Management            "
"-----------------------------------
nnoremap <TAB> :bn<CR>
nnoremap <C-TAB> :bp<CR>



"-----------------------------------
"            Searching             "
"-----------------------------------
set hlsearch
set incsearch



"-----------------------------------
"            Functions             "
"-----------------------------------

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction


function! SaveSess()
    execute 'mksession! $HOMEPATH/session.vim'
endfunction


function! LoadSess()
	if !empty(glob('$HOMEPATH/session.vim'))
		execute 'so $HOMEPATH/session.vim'
	endif
endfunction


function! SaveNerdDirectory() abort
	let g:rootPath = g:NERDTree.ForCurrentTab().getRoot().path.str()
	let g:destination = expand('~/nerdtree.txt') 
	call writefile(split(g:rootPath, '\n', 1),  g:destination)
endfunction


function! LoadNerdDirectory() abort
	let g:source = expand('~/nerdtree.txt') 

	if !empty(glob(g:source))
		let g:nerdDir = join(readfile(g:source), '\n')
	else
		let g:nerdDir = expand('~')
	endif

endfunction



"-----------------------------------
"             Mappings             "
"-----------------------------------

" Easy escape
inoremap kj <ESC>
inoremap kl <ESC>A
vnoremap kj <ESC>

" Easy commenting
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Edit .vimrc
nnoremap <Leader>ev :tabedit $MYVIMRC<cr>

" Turn off search highlighting
nnoremap <Leader><space> :nohlsearch<cr>

" Allow sleamless split navigation between vim and tmux
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"-----------------------------------
"           Auto Commands          "
"-----------------------------------

" Automatically source the .vimrc on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup nerdtree
	autocmd!
	autocmd VimLeave * NERDTreeClose
	autocmd VimLeave * call SaveSess()
    autocmd VimLeave * call SaveNerdDirectory()

	autocmd VimEnter * call LoadSess()
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * call LoadNerdDirectory()
	autocmd VimEnter * exe 'NERDTree ' . g:nerdDir | wincmd p
	"autocmd VimEnter * exe 'NERDTree ' . g:nerdDir | exe 'NERDTreeFind' | wincmd p
	"autocmd VimEnter * call NERDTreeToggleInCurDir()
augroup END

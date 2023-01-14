vim.cmd([[

" Set timeout, how long vim will wait to interpret what we are pressing (key code, cause certain key use multiple of keys combination)
set ttimeout
set ttimeoutlen=100

" Remap in Normal mode
nnoremap kj <ESC>

" Remap in Insert and Replace mode
inoremap kj <ESC>

" Remap in Visual and Select mode
vnoremap kj <ESC>

" Remap in Visual mode
xnoremap kj <ESC>

" Remap in Select mode
snoremap kj <ESC>

" Remap in Command-line mode
cnoremap kj <C-C>

" Remap in Operator pending mode
onoremap kj <ESC>

" Remap in Insert pending mode
inoremap kl <ESC>A

" Skip lines on normal mode
nnoremap <S-j> 5j
nnoremap <S-k> 5k

" Skip lines on visual mode
vnoremap <S-j> 5j
vnoremap <S-k> 5k

" Go back to previous location
nnoremap <leader>k <C-O>

" Resize split vertically
nnoremap <A-S-l> :vertical resize +5<CR>
nnoremap <A-S-h> :vertical resize -5<CR>

" Resize split horizontally
nnoremap <A-S-k> :resize +5<CR>
nnoremap <A-S-j> :resize -5<CR>

]])

vim.opt.shell = '"C:/Program Files/Git/bin/bash.exe"'
vim.opt.shellcmdflag = "--login -i -c"
vim.opt.shellxquote = ""

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'kj', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

  vim.keymap.set('t', '<A-S-l>', [[<Cmd>:vertical resize +5<CR>]], opts)
  vim.keymap.set('t', '<A-S-h>', [[<Cmd>:vertical resize -5<CR>]], opts)
  vim.keymap.set('t', '<A-S-k>', [[<Cmd>:resize +5<CR>]], opts)
  vim.keymap.set('t', '<A-S-j>', [[<Cmd>:resize -5<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
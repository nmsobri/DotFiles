vim.cmd [[
" Set timeout, how long vim will wait to interpret (key code, cause certain key use multiple of keys combination)
set ttimeout
set ttimeoutlen=100

" Set timeout, how long vim will wait to interpret what we are pressing
set timeout
set timeoutlen=400

" Disable highlight when searching
set nohlsearch
set incsearch

" Vertically center
set scrolloff=999

set backspace=indent,eol,start

" Hack to attach Lsp
augroup attach_lsp
  autocmd!
  autocmd BufEnter * doautocmd FileType
augroup end

" Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" Terminal stuff
augroup terminal_stuff
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen, TermEnter * startnormal
  autocmd TermLeave * stopinsert
augroup end

]]

local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

vim.g.mapleader = " "

-- Remap in <ESC> Insert mode
map("i", "kj", "<ESC>")

-- Remap in <ESC> Visual mode
map("v", "kj", "<ESC>")

-- Remap in <ESC> Visual mode
map("x", "kj", "<ESC>")

-- Remap in <ESC> Select mode
map("s", "kj", "<ESC>")

-- Remap in <ESC> Command Line mode
map("c", "kj", "<C-C>")

-- Remap in <ESC> Operator Pending mode
map("o", "kj", "<ESC>")

-- Remap in <ESC> Insert Pending mode
map("i", "kl", "<ESC>A")

-- Skip lines on normal mode
map("n", "<S-j>", "5j")
map("n", "<S-k>", "5k")

-- Skip lines on visual mode
map("v", "<S-j>", "5j")
map("v", "<S-k>", "5k")

-- Go back to previous location
map("n", "<leader>k", "<C-O>")

-- Resize split vertically
map("n", "<A-S-l>", ":vertical resize +5<CR>")
map("n", "<A-S-h>", ":vertical resize -5<CR>")

-- Resize split horizontally
map("n", "<A-S-k>", ":resize +5<CR>")
map("n", "<A-S-j>", ":resize -5<CR>")

-- Bind `f` to toggle fold
map("n", "s", "za")

-- Bind `f` to toggle fold recursively
map("n", "S", "zA")

map("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

map("n", "<leader>t", "<cmd>TodoTelescope<CR>")
map("n", "<TAB>", "<cmd>tabnext<CR>")
map("n", "<S-Tab>", "<cmd>tabprevious<CR>")
map("n", "<leader>n", "<cmd>tabnew<CR>")
map("n", "<leader>c", "<cmd>tabclose<CR>")
map("n", "<C-n>", ":hide enew<CR>")

map("n", "<leader>h", ":TbufLeft<CR>")
map("n", "<leader>l", ":TbufRight<CR>")

local set = vim.opt

set.shell = '"C:/Program Files/Git/bin/bash.exe"'
set.shellcmdflag = "-c"
set.shellxquote = ""

-- Disable pesky swap file
set.swapfile = false
set.backup = false

-- Highlight current line
set.cursorline = true

-- Disable show command at the bottom right corner
set.showcmd = false

-- Keybinding specifically for terminal
function _G.set_terminal_keymaps()
  local opts = {
    buffer = 0,
  }

  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

  vim.keymap.set("t", "<A-S-l>", [[<Cmd>:vertical resize +5<CR>]], opts)
  vim.keymap.set("t", "<A-S-h>", [[<Cmd>:vertical resize -5<CR>]], opts)
  vim.keymap.set("t", "<A-S-k>", [[<Cmd>:resize +5<CR>]], opts)
  vim.keymap.set("t", "<A-S-j>", [[<Cmd>:resize -5<CR>]], opts)
end

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 200,
    }
  end,
})

-- Disable highlight group for folded region
vim.cmd "autocmd VimEnter * hi! Folded ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE"
vim.cmd "autocmd ColorScheme * hi! Folded ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE"

-- Neovide specific configuration here
if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
end

-- Keybinding specifically for terminal
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }

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

vim.cmd([[
" Set timeout, how long vim will wait to interpret (key code, cause certain key use multiple of keys combination)
set ttimeout
set ttimeoutlen=100

" Set timeout, how long vim will wait to interpret what we are pressing
set timeout
set timeoutlen=400

" Disable highlight when searching
set nohlsearch
set incsearch

" Disable autofold
set nofoldenable

" Vertically center
set scrolloff=999

set backspace=indent,eol,start

" Hack to attach Lsp
augroup attach_lsp
  autocmd!
  autocmd BufEnter * doautocmd FileType
augroup end
]])

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, {
    clear = true,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q_kj"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "toggleterm",
    "Trouble",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
    })

    vim.keymap.set("n", "kj", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
    })
  end,
})

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

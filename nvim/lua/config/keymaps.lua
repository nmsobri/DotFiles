local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({
    lhs,
    mode = mode,
  }).id] then
    opts = opts or {
      silent = true,
    }
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Toggle Neotree
map("n", "<leader>xx1", "<cmd>Neotree toggle right<cr>")

-- Buffer navigation
if Util.has("bufferline.nvim") then
  map({ "i", "n", "t" }, "<A-h>", "<cmd>BufferLineCyclePrev<cr>", {
    desc = "Prev buffer",
  })
  map({ "i", "n", "t" }, "<A-l>", "<cmd>BufferLineCycleNext<cr>", {
    desc = "Next buffer",
  })
else
  map({ "i", "n", "t" }, "<A-h>", "<cmd>bprevious<cr>", {
    desc = "Prev buffer",
  })
  map({ "i", "n", "t" }, "<A-l>", "<cmd>bnext<cr>", {
    desc = "Next buffer",
  })
end

vim.g.mapleader = " "
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

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

function split_terminal_right()
  local Terminal = require("toggleterm.terminal").Terminal

  Terminal:new({
    direction = "horizontal",
  }):open()
end

vim.api.nvim_create_user_command("SplitTerminal", split_terminal_right, {})
vim.keymap.set({ "n", "i" }, "<A-j>", "<cmd>SplitTerminal<cr>")
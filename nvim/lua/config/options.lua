-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local glob = vim.g
local opt = vim.opt

glob.loaded_netrw = 1
glob.loaded_netrwPlugin = 1

opt.shell = '"C:/Program Files/Git/bin/bash.exe"'
opt.shellcmdflag = "-c"
opt.shellxquote = ""

-- Disable pesky swap file
opt.swapfile = false
opt.backup = false

-- Highlight current line
opt.cursorline = true

-- Disable relative number. I hate it
opt.relativenumber = false

-- Disable show command at the bottom right corner
opt.showcmd = false
vim.o.shada = [[!,'1000,<10000,s500,:100,/100,h]]

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.shell = '"C:/Program Files/Git/bin/bash.exe"'
opt.shellcmdflag = "-c"
opt.shellxquote = ""

-- Disable pesky swap file
opt.swapfile = false
opt.backup = false

-- Highlight current line
opt.cursorline = true

-- Disable show command at the bottom right corner
opt.showcmd = false

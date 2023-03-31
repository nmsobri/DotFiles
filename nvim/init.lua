-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, {
    clear = true,
  })
end

-- Disable folding color
vim.api.nvim_create_autocmd({ "VimEnter", "Colorscheme", "BufReadPre", "BufNewFile" }, {
  group = augroup("folding_color"),
  pattern = "*",
  callback = function()
    vim.cmd("hi! Folded ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE")
  end,
})

-- Remember folds
vim.cmd([[
" Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end
]])

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "python" },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      ensure_installed = { "help", "html", "css", "javascript", "typescript", "json", "lua", "luap", "regex", "go" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
  },
}

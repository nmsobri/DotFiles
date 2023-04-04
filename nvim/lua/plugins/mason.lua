return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vls",
        "gopls",
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "prettierd", -- "jshint",  -- doesn't support natively by mason, install manually
      },
    },
  },
}

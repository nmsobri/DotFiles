return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.jshint,
          nls.builtins.diagnostics.tidy,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.prettierd.with({
            extra_args = { "--single-quote" },
          }),
        },
      }
    end,
  },
}

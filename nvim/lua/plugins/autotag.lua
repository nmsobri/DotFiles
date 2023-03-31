return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      local options = {
        auto_install = true,
        ensure_installed = {
          "lua",
          "go",
          "css",
          "html",
          "javascript",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "javascript",
            "typescript",
            "svelte",
            "vue",
            "css",
            "lua",
          },
        },
        indent = { enable = true },
      }

      require("nvim-treesitter.configs").setup(options)
    end,
  },
}

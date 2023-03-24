return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        start_in_insert = false,
        persist_mode = true,
        shell = vim.o.shell,
      })
    end,
    opts = {},
  },
}

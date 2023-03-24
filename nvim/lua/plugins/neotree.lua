return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function()
      require("neo-tree").setup({
        window = {
          width = 25,
          mappings = {
            ["o"] = "open",
          },
        },
      })
    end,
  },
}

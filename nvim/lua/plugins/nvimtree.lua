return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
    version = "*", -- optional, updated every week. (see issue #1193)

    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = false,
          update_cwd = false,
        },

        view = {
          adaptive_size = false,
          side = "right",
          width = 25,
          hide_root_folder = true,
        },

        actions = {
          open_file = {
            resize_window = false,
          },
        },
      })
    end,
  },
}

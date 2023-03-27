local function wipeout_buffer()
  local buffers = vim.api.nvim_list_bufs()
  local buffer_wipeout_type_list = { "Trouble" }

  for _, current_buffer in ipairs(buffers) do
    local buf_ft = vim.api.nvim_buf_get_option(current_buffer, "filetype")

    for _, buffer_to_wipe_type in ipairs(buffer_wipeout_type_list) do
      if buf_ft == buffer_to_wipe_type then
        vim.api.nvim_command("bwipeout! " .. current_buffer)
      end
    end
  end
end

local function find_main_shada()
  local shada_dir = vim.fn.stdpath("data") .. "/shada"
  local main_shada_path = shada_dir .. "/main.shada"
  if vim.fn.filereadable(main_shada_path) == 1 then
    return main_shada_path
  else
    return nil
  end
end

local function save_tree_state()
  local manager = require("neo-tree.sources.manager")
  local renderer = require("neo-tree.ui.renderer")

  local state = manager.get_state("filesystem")
  local window_exists = renderer.window_exists(state)

  vim.g.TREESTATE = window_exists
  vim.cmd([[wshada]])
end

local function close_neotree()
  save_tree_state()
  local manager = require("neo-tree.sources.manager")
  manager.close_all()
end

local function open_neotree()
  if find_main_shada() ~= nil then
    vim.cmd([[rshada]])
  else
    vim.g.TREESTATE = false
  end

  if vim.g.TREESTATE == true then
    vim.cmd([[Neotree reveal right show]])
  end
end

return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      bypass_session_save_file_types = { "", "blank", "alpha", "neo-tree", "qf" },
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      pre_save_cmds = { close_neotree, wipeout_buffer },
      pre_restore_cmds = { open_neotree },
    })
  end,
}

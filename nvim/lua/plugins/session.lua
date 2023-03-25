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

local function save_tree_state()
  local manager = require("neo-tree.sources.manager")
  local windid = manager.get_state("filesystem").winid

  if windid == nil then
    windid = 0
  end

  vim.g.TREESTATE = windid
  vim.cmd([[wshada]])
end

local function close_neotree()
  save_tree_state()
  local manager = require("neo-tree.sources.manager")
  manager.close_all()
end

local function open_neotree()
  vim.cmd([[rshada]])

  if vim.g.TREESTATE > 0 then
    vim.cmd([[Neotree reveal right]])
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

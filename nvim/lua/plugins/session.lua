return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      bypass_session_save_file_types = { "", "blank", "alpha", "NvimTree", "qf" },
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

      -- Buffer to wipe out on closing
      pre_save_cmds = {
        function()
          local buffers = vim.api.nvim_list_bufs()
          local buffer_wipeout_type_list = { "qf" }

          for _, current_buffer in ipairs(buffers) do
            local buf_ft = vim.api.nvim_buf_get_option(current_buffer, "filetype")

            for _, buffer_to_wipe_type in ipairs(buffer_wipeout_type_list) do
              if buf_ft == buffer_to_wipe_type then
                vim.api.nvim_command("bwipeout! " .. current_buffer)
              end
            end
          end
        end,
      },
    })
  end,
}

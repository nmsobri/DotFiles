return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = true,
          separator = " ➜ ",
          ignore_patterns = {},
          hide_keyword = true,
          show_file = true,
          folder_level = 1,
          respect_root = false,
          color_mode = true,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {

      -- LSP finder - Find the symbol's definition
      -- If there is no definition, it will instead be hidden
      -- When you use an action in finder like "open vsplit",
      -- you can use <C-t> to jump back
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", mode = { "n" } },

      -- Code action
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" } },

      -- Rename all occurrences of the hovered word for the entire file
      { "gr", "<cmd>Lspsaga rename<CR>", mode = "n" },

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "<leader>gd", "<cmd>Lspsaga peek_definition ++keep<CR>", mode = { "n" } },
      { "<leader>j", "<cmd>Lspsaga peek_definition ++keep<CR>", mode = { "n" } },

      -- Peek type definition
      -- You can edit the file containing the type definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = { "n" } },

      -- Go to type definition
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>" },
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>", mode = { "n" } },

      -- Show line diagnostics
      -- You can pass argument ++unfocus to
      -- unfocus the show_line_diagnostics floating window
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },

      -- Show buffer diagnostics
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },

      -- Show workspace diagnostics
      { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },

      -- Show cursor diagnostics
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },

      -- Diagnostic jump
      -- You can use <C-o> to jump back to your previous location
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>" },

      -- Diagnostic jump with filters such as only jumping to an error
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
      },

      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
      },

      -- Toggle outline
      { "<leader>o", "<cmd>Lspsaga outline<CR>" },

      -- Hover Doc
      -- If there is no hover doc,
      -- there will be a notification stating that
      -- there is no information available.
      -- To disable it just use ":Lspsaga hover_doc ++quiet"
      -- Pressing the key twice will enter the hover window
      { "Q", "<cmd>Lspsaga hover_doc<CR>" },

      -- If you want to keep the hover window in the top right hand corner,
      -- you can pass the ++keep argument
      -- Note that if you use hover with ++keep, pressing this key again will
      -- close the hover window. If you want to jump to the hover window
      -- you should use the wincmd command "<C-w>w"
      -- { "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },

      -- Call hierarchy
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },

      -- Floating terminal
      { "<A-d>", "<cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" } },
    },
  },
}

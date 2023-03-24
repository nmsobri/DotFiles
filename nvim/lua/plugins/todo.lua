return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = {
            icon = " ",
            color = "info",
          },
          HACK = {
            icon = " ",
            color = "warning",
          },
          WARN = {
            icon = " ",
            color = "warning",
            alt = { "WARNING", "XXX" },
          },
          PERF = {
            icon = " ",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
          },
          NOTE = {
            icon = " ",
            color = "hint",
            alt = { "INFO" },
          },
          TEST = {
            icon = "⏲ ",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED" },
          },
        },
        gui_style = {
          fg = "NONE", -- The gui style to use for the fg highlight group.
          bg = "BOLD", -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        search = {
          command = "rg",
          args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS)\s*:]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]] -- match without the extra colon. You'll likely get false positives
        },
      })
    end,
  },
}

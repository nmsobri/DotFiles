return {

    ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end
    },

    ["williamboman/mason.nvim"] = {
        override_options = {
            ensure_installed = {"gopls", "lua-language-server", "stylua"}
        }
    },

    ["goolord/alpha-nvim"] = {
        disable = false
    },

    ["rmagatti/auto-session"] = {
        config = function()
            require("auto-session").setup {
                bypass_session_save_file_types = {"", "blank", "alpha", "NvimTree"},
                log_level = "error",
                auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/"}
            }
        end
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end
    },

    ["akinsho/toggleterm.nvim"] = {
        tag = '*',
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = 'float',
                start_in_insert = false,
                persist_mode = true,
                shell = vim.o.shell
            })
        end
    },

    ["kyazdani42/nvim-tree.lua"] = {
        requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
        tag = 'nightly', -- optional, updated every week. (see issue #1193)

        override_options = {
            update_focused_file = {
                enable = false,
                update_cwd = false
            },

            view = {
                adaptive_size = false,
                side = "right",
                width = 25,
                hide_root_folder = true
            },

            actions = {
                open_file = {
                    resize_window = false
                }
            }

        }
    },

    ["hrsh7th/nvim-cmp"] = {
        override_options = function()
            local cmp = require "cmp"

            return {
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item()
                }
            }

        end
    },

    ["kevinhwang91/nvim-ufo"] = {
        requires = 'kevinhwang91/promise-async',

        config = function()
            require("custom.plugins.ufo")
        end

    },

    ["folke/todo-comments.nvim"] = {
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                signs = true, -- show icons in the signs column
                sign_priority = 8, -- sign priority
                -- keywords recognized as todo comments
                keywords = {
                    FIX = {
                        icon = " ", -- icon used for the sign, and in search results
                        color = "error", -- can be a hex color, or a named color (see below)
                        alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = {
                        icon = " ",
                        color = "info"
                    },
                    HACK = {
                        icon = " ",
                        color = "warning"
                    },
                    WARN = {
                        icon = " ",
                        color = "warning",
                        alt = {"WARNING", "XXX"}
                    },
                    PERF = {
                        icon = " ",
                        alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}
                    },
                    NOTE = {
                        icon = " ",
                        color = "hint",
                        alt = {"INFO"}
                    },
                    TEST = {
                        icon = "⏲ ",
                        color = "test",
                        alt = {"TESTING", "PASSED", "FAILED"}
                    }
                },
                gui_style = {
                    fg = "NONE", -- The gui style to use for the fg highlight group.
                    bg = "BOLD" -- The gui style to use for the bg highlight group.
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
                    args = {"--color=never", "--no-heading", "--with-filename", "--line-number", "--column"},
                    -- regex that will be used to match keywords.
                    -- don't replace the (KEYWORDS) placeholder
                    pattern = [[\b(KEYWORDS)\s*:]] -- ripgrep regex
                    -- pattern = [[\b(KEYWORDS)\b]] -- match without the extra colon. You'll likely get false positives
                }
            }
        end
    },

    ["nvim-telescope/telescope.nvim"] = {
        override_options = function()
            local action = require "telescope.actions"

            return {
                defaults = {
                    mappings = {
                        n = {
                            ["kj"] = action.close,
                            ["<C-j>"] = action.move_selection_next,
                            ["<C-k>"] = action.move_selection_previous
                        },

                        i = {
                            ["<C-j>"] = action.move_selection_next,
                            ["<C-k>"] = action.move_selection_previous
                        }
                    }
                }
            }

        end

    }

}

return {

	["neovim/nvim-lspconfig"] = {
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.plugins.lspconfig"
		end,
	},

	["williamboman/mason.nvim"] = {
		override_options = {
			ensure_installed = { "gopls", "lua-language-server", "stylua",}
		}
	},
	
	["goolord/alpha-nvim"] = {
		disable = false,
	},
	
	
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require "custom.plugins.null-ls"
		end,
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
		end,
	},

	["kyazdani42/nvim-tree.lua"] = {
		override_options = {
			update_focused_file = {
				enable = false,
				update_cwd = false,
			},
			
			view = {
				adaptive_size = true,
				side = "right",
				width = 25,
				hide_root_folder = true,
			},
		}
	},

	["hrsh7th/nvim-cmp"] = {
		override_options = function()
		local cmp = require "cmp"

		return {
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
			},
		}

		end,
	},

	["kevinhwang91/nvim-ufo"] = {
		requires = 'kevinhwang91/promise-async',

		config = function()
            require("custom.plugins.ufo")
		end,

	},

}
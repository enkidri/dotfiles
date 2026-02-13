-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<C-n>", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
		{ "<C-f>", ":Neotree reveal<CR>", desc = "NeoTree reveal current file", silent = true },
	},
	opts = {
		window = {
			position = "left",
			width = "35",
			auto_resize = true,
		},
		close_if_last_window = true,
		popup_border_style = "NC",
		filesystem = {
			window = {
				mappings = {
					["<C-n>"] = "close_window",
				},
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_ignored = false,
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.relativenumber = true
				end,
			},
		},
	},
}

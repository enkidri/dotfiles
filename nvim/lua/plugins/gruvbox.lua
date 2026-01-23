return {
	{
		-- 'ellisonleao/gruvbox.nvim' is the most popular Lua version of Gruvbox
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Load this before other plugins
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = false,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, highlights, statusline and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			-- Load the colorscheme
			vim.cmd.colorscheme("gruvbox")

			-- Override transparency for floats to non-transparent
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828" })
		end,
	},
}

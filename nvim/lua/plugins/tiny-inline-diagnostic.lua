-- tiny-inline-diagnostic is a Neovim plugin to show nicer inline diagnostics
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach", -- Load when an LSP connects to a buffer
	priority = 1000, -- Ensure it loads before other UI tweaks
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern", -- options: "modern", "classic", "minimal"
			options = {
				show_source = true, -- Show if the error is from 'lua_ls', 'pyright', etc.
				use_icons_from_diagnostic = true,
				-- This ensures it doesn't overlap with blink-cmp or other floats
				add_vertical_space = true,
				-- Show diagnostics at multiple lines
				multilines = false,
				show_all_diags_on_cursorline = false,
			},
		})

		-- IMPORTANT: Disable default virtual text to avoid "double text"
		vim.diagnostic.config({ virtual_text = false })
	end,
}

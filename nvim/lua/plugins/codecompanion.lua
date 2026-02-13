return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "stevearc/dressing.nvim", opts = {} },
	},
	opts = {
		-- 1. Use "strategies" instead of "interactions"
		strategies = {
			chat = {
				adapter = "copilot",
				keymaps = {
					close = {
						modes = {
							n = "q",
							i = "<Nop>", -- Keeps C-c as "Escape to Normal mode"
						},
					},
				},
			},
			inline = {
				adapter = "copilot",
				keymaps = {
					accept_change = { modes = { n = "ga" } }, -- Press 'ga' to accept
					reject_change = { modes = { n = "gr" } }, -- Press 'gr' to reject
				},
			},
			agent = { adapter = "copilot" },
		},
		display = {
			chat = {
				window = {
					layout = "vertical",
					width = 0.3,
				},
			},
		},
	},
	keys = {
		{ "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Chat" },
		{ "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "AI Inline Prompt" },
		{ "<leader>ax", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
		{ "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "AI Add to Chat" },
	},
}

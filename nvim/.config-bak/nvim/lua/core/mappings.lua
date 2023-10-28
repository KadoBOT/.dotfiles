local wk = require("which-key")

wk.register({
	["<C-^>"] = "which_key_ignore",
	["$"] = "which_key_ignore",
	["<leader>"] = { "<c-^>", "which_key_ignore" },
	t = {
		name = "+Toggle",
		t = { ":TroubleToggle<CR>", "Trouble" },
		z = { ":ZenMode<CR>", "ZenMode" },
	},
	g = {
		name = "+Git",
	},
}, { prefix = "<leader>" })

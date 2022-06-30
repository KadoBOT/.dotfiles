local wk = require("which-key")
local hydra = require('hydra')

wk.register({
	["<leader>Hsl"] = "Scroll left",
	["<leader>Hsz"] = "Scroll right",
	["<leader>HsL"] = "Scroll half-screen left",
	["<leader>HsZ"] = "Scroll half-screen left",
})

hydra({
	name = "Side scroll",
	mode = "n",
	body = "<leader>Hs",
	heads = {
		{ "l", "5zh" },
		{ "z", "5zl", { desc = '←/→' } },
		{ "L", "zH" },
		{ "Z", "zL", { desc = 'half screen ←/→' } },
	}
})


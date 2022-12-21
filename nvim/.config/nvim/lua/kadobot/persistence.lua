require("persistence").setup()

local wk = require("which-key")

wk.register({
	name = "Session",
	["d"] = { [[<cmd>lua require("persistence").load()<cr>]], "Load Dir Session" },
	["l"] = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "Load Last Session" },
}, { prefix = "<leader>l" })

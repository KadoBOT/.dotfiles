local reach = require("reach")
local wk = require("which-key")

reach.setup({ notifications = true })

local opts = { handle = "dynamic" }
local openBufList = function()
	reach.buffers(opts)
end

vim.api.nvim_set_keymap("n", "'", ":ReachOpen marks<CR>", {})

wk.register({
	bb = {
		openBufList,
		"Buffer Explorer",
	},
	m = { ":ReachOpen marks<CR>", "Marks" },
}, { prefix = "<leader>" })

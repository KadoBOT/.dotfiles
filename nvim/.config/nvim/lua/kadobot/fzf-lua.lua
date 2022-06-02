local wk = require('which-key')
local f = require('fzf-lua')

wk.register({
	["b"] = { f.buffers, "Buffers" },
	["f"] = { f.files, "Files" },
	["o"] = { f.oldfiles, "Oldfiles" },
	["q"] = { f.quickfix, "Quickfix" },
	["l"] = { f.loclist, "Loclist" },
	["L"] = { f.lines, "Lines" },
	["B"] = { f.blines, "Buffer Lines" },
	["t"] = { f.tabs, "Tabs" },
	["a"] = { f.args, "Argument List" },
}, { prefix = "<leader>z", name = "Fzf" })

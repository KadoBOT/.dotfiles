require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, _level, _diagnostics_dict, _context)
			return "(" .. count .. ")"
		end,
		diagnostics_update_in_insert = true,
		separator_style = "thick",
		modified_icon = "",
		close_icon = "",
		indicator_icon = "",
		right_trunc_marker = "",
		left_trunc_marker = "",
		offsets = {
			{
				filetype = "neo-tree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "right",
			},
		},
	},
})

local wk = require("which-key")

wk.register({
	name = "Buffer",
	["p"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
	["n"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
	["c"] = { ":BufferLineClosePick<CR>", "Close Buffer" },
	["d"] = { ":BufferLineCloseRight<CR>", "Close Right" },
	["1"] = { ":BufferLineGoToBuffer 1<CR>", "Buffer 1" },
	["2"] = { ":BufferLineGoToBuffer 2<CR>", "Buffer 2" },
	["3"] = { ":BufferLineGoToBuffer 3<CR>", "Buffer 3" },
	["4"] = { ":BufferLineGoToBuffer 4<CR>", "Buffer 4" },
	["5"] = { ":BufferLineGoToBuffer 5<CR>", "Buffer 5" },
	["6"] = { ":BufferLineGoToBuffer 6<CR>", "Buffer 6" },
	["7"] = { ":BufferLineGoToBuffer 7<CR>", "Buffer 7" },
	["8"] = { ":BufferLineGoToBuffer 8<CR>", "Buffer 8" },
	["9"] = { ":BufferLineGoToBuffer 9<CR>", "Buffer 9" },
}, { prefix = "<leader>b" })

wk.register({
	["<C-p>"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
	["<C-n>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
})

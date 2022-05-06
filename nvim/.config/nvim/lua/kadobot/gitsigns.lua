local wk = require("which-key")

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	keymaps = {},
	on_attach = function(bufnr)
		wk.register({
			name = "Git Signs",
			["s"] = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			["u"] = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
			["r"] = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
			["S"] = { ":Gitsigns stage_buffer<CR>", "Stage Buffer" },
			["R"] = { ":Gitsigns stage_buffer<CR>", "Reset Buffer" },
			["p"] = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
			["b"] = { "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Blame Line" },
			["t"] = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame" },
			["d"] = { ":Gitsigns diffthis<CR>", "Diff This" },
			["D"] = { "<cmd>lua require'gitsigns'.diffthis('~')<CR>", "Diff This ~" },
			["T"] = { ":Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
		}, { prefix = "<C-G>", mode = "n", buffer = bufnr })

		wk.register({
			name = "Git Signs",
			["s"] = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			["u"] = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
		}, { prefix = "<C-G>", mode = "v", buffer = bufnr })
	end,
})

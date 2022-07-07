local saga = require("lspsaga")
local finder = require("lspsaga.finder")
local action = require("lspsaga.codeaction")
local hover = require("lspsaga.hover")
local sig = require("lspsaga.signaturehelp")
-- local rename = require("lspsaga.rename")
local def = require("lspsaga.definition")
local diag = require("lspsaga.diagnostic")

local wk = require("which-key")

saga.init_lsp_saga({
	max_preview_lines = 40,
	move_in_saga = { prev = "<C-p>", next = "<C-n>" },
	finder_action_keys = {
		quit = {"<Esc>", "q"},
		open = "<CR>",
		scroll_down = "[",
		scroll_up = "]",
	},
})

wk.register({
	K = hover.render_hover_doc()
})

wk.register({
	R = { finder.lsp_finder, "Find Reference" },
	a = { action.code_action, "Code Action" },
	s = { sig.signature_help, "Signature Help" },
	-- r = { rename.lsp_rename, "Rename" },
	d = { def.preview_definition, "Preview Definition" },
}, { prefix = "g" })

wk.register({
	d = { diag.show_line_diagnostics, "Show Line Diagnostics" },
}, { prefix = "c" })

wk.register({
	a = {
		function()
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
			action.range_code_action()
		end,
		"Code Action",
	},
}, { prefix = "g", mode = "v" })

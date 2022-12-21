local Hydra = require("hydra")
local aerial = require("aerial")

local hint = [[
 _n_: next diagnostic   _p_: previous diagnostic  _a_: code action
 _N_: next symbol       _P_: previous symbol      _s_: toggle symbol tree
 ^                      _q_: exit
]]

for _, value in pairs({ "gn", "gp", "gz" }) do
	Hydra({
		hint = hint,
		name = "LSP Hydra",
		config = {
			invoke_on_body = true,
			color = "pink",
			hint = {
				position = "bottom",
				border = "rounded",
			},
			on_enter = function()
				if value == "gn" then
					vim.diagnostic.goto_next()
				elseif value == "gz" then
					vim.diagnostic.show_line_diagnostics()
				else
					vim.diagnostic.goto_prev()
				end
				aerial.open()
			end,
			on_exit = function()
				aerial.close()
			end,
		},
		mode = { "n" },
		body = value,
		heads = {
			{
				"n",
				function()
					vim.diagnostic.goto_next()
				end,
			},
			{
				"p",
				function()
					vim.diagnostic.goto_prev()
				end,
			},
			{
				"N",
				function()
					aerial.next()
				end,
			},
			{
				"P",
				function()
					aerial.next(-1)
				end,
			},
			{
				"s",
				function()
					if aerial.is_open() then
						aerial.close()
					else
						aerial.open()
					end
				end,
			},
			{
				"a",
				function()
					vim.lsp.buf.code_action()
					return "<Ignore>"
				end,
			},
			{
				"q",
				nil,
				{ exit = true, nowait = true },
			},
		},
	})
end

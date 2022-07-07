local Hydra = require("hydra")
local dapui = require("dapui")
local dap = require("dap")

local hint = [[
 _b_: toggle breakpoint _c_: run/continue  _r_: open repl
 _o_: step over         _i_: step into     _B_: breakpoint condition
 _L_: log point         _R_: run last      _e_: eval
 ^                      _q_: exit
]]

Hydra({
	hint = hint,
	name = "DAP Hydra",
	config = {
		invoke_on_body = true,
		color = "pink",
		hint = {
			position = "top-right",
			border = "rounded",
		},
		on_enter = function()
			dapui.open()
		end,
		on_exit = function()
			dap.terminate()
			dapui.close()
		end,
	},
	mode = { "n" },
	body = "<C-D>",
	heads = {
		{
			"b",
			dap.toggle_breakpoint,
		},
		{
			"B",
			function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
		},
		{
			"L",
			function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
		},
		{
			"c",
			dap.continue,
		},
		{
			"o",
			dap.step_over,
		},
		{
			"i",
			dap.step_into,
		},
		{
			"r",
			dap.repl.open,
		},
		{
			"R",
			dap.run_last,
		},
		{
			"e",
			dapui.eval
		},
		{
			"q",
			nil,
			{ exit = true, nowait = true },
		},
	},
})

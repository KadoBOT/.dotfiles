local dap = require("dap")
local config = require("kadobot.dap.debuggers")
local widgets = require("dap.ui.widgets")
local ok = pcall(require, "hydra")

dap.adapters = config.adapters
dap.configurations = config.configurations

if not ok then
	local wk = require("which-key")
	wk.register({
		name = "Debugger",
		["b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		["c"] = { ":lua require'dap'.continue()<CR>", "Run Debugger" },
		["o"] = { ":lua require'dap'.step_over()<CR>", "Step Over" },
		["i"] = { ":lua require'dap'.step_into()<CR>", "Step Into" },
		["r"] = { ":lua require'dap'.repl.open()<CR>", "Open REPL" },
		["t"] = {
			function()
				widgets.centered_float(widgets.scopes)
			end,
			"Open Scopes",
		},
		["f"] = {
			function()
				widgets.centered_float(widgets.frames)
			end,
			"Open Frames",
		},
	}, { prefix = "<C-D>" })
end

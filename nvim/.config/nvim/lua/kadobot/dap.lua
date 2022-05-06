local dap = require("dap")
local wk = require('which-key')

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/Projects/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/Projects/vscode-chrome-debug/out/src/chromeDebug.js"}
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.configurations.typescript = {
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

wk.register({
    name = 'Debugger',
    ["b"] = {":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint"},
    ["c"] = {":lua require'dap'.continue()<CR>", "Run Debugger"},
    ["o"] = {":lua require'dap'.step_over()<CR>", "Step Over"},
    ["i"] = {":lua require'dap'.step_into()<CR>", "Step Into"},
    ["r"] = {":lua require'dap'.repl.open()<CR>", "Open REPL"},
}, { prefix = "<leader>d" })

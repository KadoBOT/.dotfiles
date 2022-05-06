local wk = require("which-key")

local function project_files()
	local opts = {}
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

local ok = pcall(require, "dap")
if ok then
	wk.register({
		name = "Telescope",
		["c"] = { ":Telescope dap commands<CR>", "Commands" },
		["g"] = { ":Telescope dap configurations<CR>", "Configurations" },
		["l"] = { ":Telescope dap list_breakpoints<CR>", "List Breakpoints" },
		["v"] = { ":Telescope dap variables<CR>", "Variables" },
		["f"] = { ":Telescope dap frames<CR>", "Frames" },
	}, { prefix = "<leader>dt" })
end

wk.register({
	["<leader>h"] = { name = "History" },
	["<leader>hc"] = { "<cmd>Telescope command_history<cr>", "Command History" },
	["<leader>hs"] = { "<cmd>Telescope search_history<cr>", "Search History" },
	["<leader>hf"] = { "<cmd>Telescope oldfiles<cr>", "FIles History" },
	["'"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Fuzzy Find" },
	["!"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
	["<leader>f"] = { name = "Files" },
	["<leader>ff"] = { project_files, "Find Files" },
	["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
	["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
	["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
	["<leader>ft"] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
	["<leader>cs"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	["<leader>cl"] = { "<cmd>Telescope treesitter<cr>", "Treesitter List" },
	["<leader>cS"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
	["<leader>fp"] = { "<cmd>Telescope project<cr>", "Projects" },
	["<leader>fx"] = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
	["<leader>fw"] = { "<cmd>Telescope grep_string<cr>", "Find Word" },
	["<leader>g"] = { name = "Git" },
	["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Branches" },
	["<leader>gt"] = { "<cmd>Telescope git_stash<cr>", "Stash" },
	["<leader>gs"] = { "<cmd>Telescope git_status<cr>", "Status" },
	["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Commits" },
	["<leader>gC"] = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
})

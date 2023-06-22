return {
	{ "gpanders/editorconfig.nvim" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		version = false,
		dependencies = {
			{ "windwp/nvim-autopairs" },
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{ "saadparwaiz1/cmp_luasnip" },
			{ "ray-x/cmp-treesitter" },
		},
		config = function()
			require("kadobot.cmp")
		end,
	},
	{ "jose-elias-alvarez/typescript.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("kadobot.null-ls")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"neovim/nvim-lspconfig",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("kadobot.treesitter")
		end,
	},
	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("kadobot.trouble")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({
				cmd_name = "IncRename",
				hl_group = "Substitute",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"onsails/lspkind-nvim",
		},
		config = function()
			require("kadobot.lsp")
		end,
		keys = {
			{
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				desc = "Hover Doc",
			},
			{
				"<leader>e",
				"<cmd>lua vim.diagnostic.setqflist()<CR>",
				desc = "Add to Quickfix",
			},
			{
				"<leader>q",
				"<cmd>lua vim.diagnostic.setloclist()<CR>",
				desc = "Add to Loclist",
			},
			{ "gr", ":IncRename " .. vim.fn.expand("<cword>") },
			{
				"gD",
				"<cmd>lua vim.lsp.buf.declaration()<CR>",
				desc = "Go to declaration",
			},
			{
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				desc = "Go to definition",
			},
			{
				"gi",
				":Telescope lsp_implementations<CR>",
				desc = "Go to implementation",
			},
			-- ["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			{
				"gR",
				":Telescope lsp_references<CR>",
				desc = "References",
			},
			{
				"gs",
				"<cmd>lua vim.lsp.buf.signature_help()<CR>",
				desc = "Signature Help",
			},
			{
				"gy",
				":Telescope lsp_document_symbols<CR>",
				desc = "Document symbols",
			},
			{
				"gY",
				":Telescope lsp_dynamic_workspace_symbols<CR>",
				desc = "Workspace Symbols",
			},
			{
				"gt",
				":Telescope lsp_type_definitions<CR>",
				desc = "Type Definition",
			},
			-- ["a"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
			-- ["z"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
			-- ["o"] = { ":Telescope diagnostics<CR>", "Document Diagnostics" },
			{
				"ge",
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				desc = "Float diagnostic",
			},
			-- ["n"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to prev diagnostic" },
			-- ["p"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to prev diagnostic" },
			{
				"gf",
				"<cmd>lua vim.lsp.buf.format()<CR>",
				desc = "Format Buffer",
			},
			{
				"gf",
				"<cmd>lua vim.lsp.buf.range_formatting()<CR>",
				mode = "v",
				desc = "Format Buffer",
			},
			{
				"<leader>=a",
				"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
				desc = "Add folder",
			},
			{
				"<leader>=r",
				"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
				desc = "Remove Workspace Folder",
			},
			{
				"<leader>=l",
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
				desc = "List Workspace Folders",
			},
			{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
			{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
			{ "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Buffer" },
			{ "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", mode = "i" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("kadobot.autopairs")
		end,
	},
	{
		{
			"echasnovski/mini.comment",
			version = false,
			config = function()
				require("mini.comment").setup()
			end,
		},
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

return require("lazy").setup({
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	},
	{
		"nathom/filetype.nvim",
		config = function()
			vim.g.did_load_filetypes = 1
			require("filetype").setup({
				overrides = {
					extensions = {
						v = "vlang",
						proto = "proto",
						puml = "plantuml",
						esdl = "edgeql",
						cql = "sql",
					},
				},
			})
		end,
	},
	"nvim-lua/plenary.nvim",
	{
		"antoinemadec/FixCursorHold.nvim",
		event = "BufRead",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("kadobot.persistence")
		end,
	},
	{
		"abecodes/tabout.nvim",
		after = { "nvim-cmp" },
		wants = { "nvim-treesitter" },
		config = function()
			require("tabout").setup({})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		tag = "v3.1.0",
		config = function()
			require("kadobot.bufferline")
		end,
	},
	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup()
		end,
	},
	{ "editorconfig/editorconfig-vim" },
	{
		"folke/paint.nvim",
		config = function()
			require("paint").setup({
				highlights = {
					{
						filter = { filetype = "go" },
						pattern = "^%/%/%s*(%w+)%s*[^\n]%w",
						hl = "Keyword",
					},
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("kadobot.trouble")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("kadobot.which-key")
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("kadobot.alpha")
		end,
	},
	{
		"ggandor/lightspeed.nvim",
		config = function()
			require("kadobot.lightspeed")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("kadobot.lspsaga")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
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
			{ "hrsh7th/vim-vsnip" },
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
	{ "nvim-tree/nvim-web-devicons" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("kadobot.indent-blankline")
		end,
	},
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			vim.opt.colorcolumn = "121"
			require("virt-column").setup()
		end,
	},
	{
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#dca561",
					delete = "#c34043",
					insert = "#a3d4d5",
					visual = "#957fb8",
				},
				ignore_filetypes = { "neo-tree", "TelescopePrompt" },
			})
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("kadobot.smart-splits")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			"tpope/vim-fugitive",
		},
		config = function()
			require("kadobot.lualine")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("kadobot.neo-tree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-fzf-writer.nvim",
		},
		config = function()
			require("kadobot.telescope")
		end,
		init = function()
			require("kadobot.telescope_setup")
		end,
		cmd = "Telescope",
	},
	{
		"nvim-telescope/telescope-fzf-writer.nvim",
		after = "telescope.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("kadobot.treesitter")
		end,
	},
	{ "onsails/lspkind-nvim" },
	{ "qpkorr/vim-bufkill" },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kadobot.kanagawa")
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
		"stevearc/aerial.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("kadobot.aerial")
		end,
	},
	{
		"toppair/reach.nvim",
		config = function()
			require("kadobot.reach")
		end,
	},
	{ "tpope/vim-eunuch" },
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("kadobot.gitsigns")
		end,
	},
	{ "wellle/targets.vim" },
	"williamboman/mason.nvim",
	{
		"williamboman/mason-lspconfig.nvim",
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
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("kadobot.autopairs")
		end,
	},
})

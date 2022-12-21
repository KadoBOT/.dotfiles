local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use({
		{
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient").enable_profile()
			end,
		},
		"wbthomason/packer.nvim",
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
			module = "persistence",
			config = [[require('kadobot.persistence')]],
		},
	})
	use({
		"abecodes/tabout.nvim",
		after = { "nvim-cmp" },
		wants = { "nvim-treesitter" },
		config = function()
			require("tabout").setup({})
		end,
	})
	use({ "aklt/plantuml-syntax" })
	use({ "anuvyklack/hydra.nvim", requires = "anuvyklack/keymap-layer.nvim", config = [[require('kadobot.hydra')]] })
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		tag = "v2.*",
		config = [[require('kadobot.bufferline')]],
	})
	use({
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup()
		end,
	})
	use({
		"Darazaki/indent-o-matic",
		config = function()
			require("indent-o-matic").setup({})
		end,
	})
	use({ "edgedb/edgedb-vim" })
	use({ "editorconfig/editorconfig-vim" })
	use({ "folke/lua-dev.nvim" })
	use({
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
	})
	use({ "folke/trouble.nvim", config = [[require('kadobot.trouble')]] })
	use({ "folke/twilight.nvim" })
	use({ "folke/which-key.nvim", config = [[require('kadobot.which-key')]] })
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				plugins = {
					kitty = { enabled = true },
				},
			})
		end,
	})
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = [[require('kadobot.alpha')]],
	})
	use({ "ggandor/lightspeed.nvim", config = [[require('kadobot.lightspeed')]] })
	use({ "glepnir/lspsaga.nvim", branch = "main", config = [[require('kadobot.lspsaga')]] })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
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
			{
				-- "KadoBOT/cmp-plugins",
				"~/Projects/cmp-plugins",
				config = function()
					require("cmp-plugins").setup({
						files = { "plugins.lua" },
					})
				end,
			},
		},
		config = [[require('kadobot.cmp')]],
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_preview_options = {
				uml = { server = "http://localhost:8888", imageFormat = "svg" },
			}
		end,
		ft = { "markdown" },
	})
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim", config = [[require('kadobot.null-ls')]] })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('kadobot.indent-blankline')]],
	})
	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			vim.opt.colorcolumn = "121"
			require("virt-column").setup()
		end,
	})
	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup()
		end,
	})
	use({
		"mbbill/undotree",
		opt = true,
		cmd = { "UndotreeShow" },
		config = function()
			vim.keymap.set("n", "<Space>tu", ":UndotreeShow<CR>", { desc = "UndoTree" })
		end,
	})
	use({
		{ "mfussenegger/nvim-dap", config = [[require('kadobot.dap')]] },
		{
			"theHamsta/nvim-dap-virtual-text",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
			requires = "mfussenegger/nvim-dap",
		},
		{
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			config = function()
				require("dapui").setup()
				require("which-key").register({ ["<C-D>h"] = { require("dapui").toggle, "Toggle UI" } })
			end,
		},
	})
	use({
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
	})
	use({
		"mrjones2014/smart-splits.nvim",
		config = [[require('kadobot.smart-splits')]],
	})
	use({ "nanotee/sqls.nvim" })
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
			"tpope/vim-fugitive",
		},
		config = [[require('kadobot.lualine')]],
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = [[require('kadobot.neo-tree')]],
	})
	use({
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-project.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-dap.nvim",
				"telescope-fzf-native.nvim",
				"telescope-fzf-writer.nvim",
			},
			wants = {
				"plenary.nvim",
				"telescope-fzf-native.nvim",
			},
			config = [[require('kadobot.telescope')]],
			setup = [[require('kadobot.telescope_setup')]],
			cmd = "Telescope",
			module = "telescope",
		},
		{
			"nvim-telescope/telescope-fzf-writer.nvim",
			after = "telescope.nvim",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"neovim/nvim-lspconfig",
		},
		config = [[require('kadobot.treesitter')]],
	})
	use({ "onsails/lspkind-nvim" })
	use({ "qpkorr/vim-bufkill" })
	use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "rebelot/kanagawa.nvim", config = [[require('kadobot.kanagawa')]] })
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({
				cmd_name = "IncRename",
				hl_group = "Substitute",
			})
		end,
	})
	use({
		"stevearc/aerial.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = [[require('kadobot.aerial')]],
	})
	use({
		"toppair/reach.nvim",
		config = [[require('kadobot.reach')]],
	})
	use({ "tpope/vim-eunuch" })
	use({
		{ "tpope/vim-fugitive" },
		{
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = [[require('kadobot.gitsigns')]],
		},
	})
	use({ "wellle/targets.vim" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"neovim/nvim-lspconfig",
			requires = {
				"hrsh7th/nvim-cmp",
				"onsails/lspkind-nvim",
			},
			config = [[require('kadobot.lsp')]],
		},
	})
	use({ "windwp/nvim-autopairs", config = [[require('kadobot.autopairs')]] })
	use({
		"wuelnerdotexe/vim-astro",
		config = function()
			vim.g.astro_typescript = "enable"
		end,
	})

	if Packer_bootstrap then
		require("packer").sync()
	end
end)

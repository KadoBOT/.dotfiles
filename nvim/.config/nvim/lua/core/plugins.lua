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
			"olimorris/persisted.nvim",
			module = "persisted",
			config = function()
				require("persisted").setup()
			end,
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
	use({
		{ "arcticicestudio/nord-vim", opt = true },
		{ "nTBBloodbath/doom-one.nvim", config = [[require('kadobot.doom-one')]], opt = true },
		{ "navarasu/onedark.nvim", opt = true },
		{ "folke/tokyonight.nvim", opt = true },
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		tag = "v2.*",
		config = [[require('kadobot.bufferline')]],
	})
	use({ "christoomey/vim-tmux-navigator" })
	use({ "editorconfig/editorconfig-vim" })
	use({ "folke/lua-dev.nvim" })
	use({ "folke/trouble.nvim", config = [[require'kadobot.trouble']] })
	use({ "folke/which-key.nvim", config = [[require('kadobot.which-key')]] })
	use({ "ggandor/lightspeed.nvim", config = [[require('kadobot.lightspeed')]] })
	use({ "glepnir/dashboard-nvim", config = [[require('kadobot.dashboard')]] })
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
				"KadoBOT/cmp-plugins",
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
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('kadobot.indent-blankline')]],
	})
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
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
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({
		{
			"neovim/nvim-lspconfig",
			requires = {
				"hrsh7th/nvim-cmp",
				"onsails/lspkind-nvim",
				"williamboman/nvim-lsp-installer",
			},
			config = [[require('kadobot.lsp')]],
		},
		{
			"williamboman/nvim-lsp-installer",
			config = [[require('kadobot.lsp-installer')]],
		},
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
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-project.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
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
	use({ "windwp/nvim-autopairs", config = [[require('kadobot.autopairs')]] })

	if Packer_bootstrap then
		require("packer").sync()
	end
end)

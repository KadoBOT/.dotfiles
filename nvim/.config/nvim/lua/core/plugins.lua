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
		"nathom/filetype.nvim",
		"nvim-lua/plenary.nvim",
		{
			"antoinemadec/FixCursorHold.nvim",
			event = "BufRead",
			config = function()
				vim.g.cursorhold_updatetime = 100
			end,
		},
	})
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" },
		after = { "nvim-cmp" },
		config = function()
			require("tabout").setup({})
		end,
	})
	use({
		{ "arcticicestudio/nord-vim", opt = true },
		{ "nTBBloodbath/doom-one.nvim", config = [[require('kadobot.doom-one')]], opt = true },
		{ "navarasu/onedark.nvim", opt = true },
		{ "folke/tokyonight.nvim", opt = true },
		{ "rebelot/kanagawa.nvim" },
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('kadobot.bufferline')]],
	})
	use({ "christoomey/vim-tmux-navigator" })
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use({ "folke/trouble.nvim", config = [[require'kadobot.trouble']] })
	use({ "folke/which-key.nvim" })
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
			{ "ray-x/cmp-treesitter" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/vim-vsnip" },
		},
		config = [[require('kadobot.cmp')]],
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('kadobot.nvim-tree')]],
	})
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				filetype_exclude = { "lspinfo", "packer", "checkhealth", "help", "dashboard", "telescope", "" },
				show_current_context = true,
				show_current_context_start = true,
				use_treesitter = true,
			})
		end,
	})
	use({ "mbbill/undotree", opt = true, cmd = { "UndotreeShow" } })
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"hrsh7th/nvim-cmp",
		},
		config = [[require('kadobot.lsp')]],
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
			"kyazdani42/nvim-tree.lua",
		},
		config = [[require('kadobot.lualine')]],
	})
	use({
		{
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-symbols.nvim",
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
	use({ "psliwka/vim-smoothie" })
	use({ "qpkorr/vim-bufkill" })
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-gps").setup()
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
	use({ "windwp/nvim-autopairs", config = [[ require'kadobot.autopairs' ]] })

	if Packer_bootstrap then
		require("packer").sync()
	end
end)

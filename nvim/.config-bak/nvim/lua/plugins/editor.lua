return {
	{
		"abecodes/tabout.nvim",
		after = { "nvim-cmp" },
		wants = { "nvim-treesitter" },
		config = function()
			require("tabout").setup({})
		end,
	},
	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup()
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("kadobot.efm")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("kadobot.which-key")
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()
			-- The below settings make Leap's highlighting closer to what you've been
			-- used to in Lightspeed.

			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
			vim.api.nvim_set_hl(0, "LeapMatch", {
				-- For light themes, set to 'black' or similar.
				fg = "white",
				bold = true,
				nocombine = true,
			})

			-- Lightspeed colors
			-- primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
			-- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
			-- shortcuts: bg = "#f00077", fg = "white"
			-- You might want to use either the primary label or the shortcut colors
			-- for Leap primary labels, depending on your taste.
			vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
				fg = "#ff2f87",
				bold = true,
				nocombine = true,
			})
			vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
				fg = "#99ddff",
				bold = true,
				nocombine = true,
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	{
		"nvimdev/lspsaga.nvim",
		branch = "main",
		config = function()
			require("kadobot.lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "K", ":Lspsaga hover_doc<CR>" },
			{ "ga", ":Lspsaga code_action<CR>", desc = "Code Action" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("kadobot.indent-blankline")
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("kadobot.smart-splits")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
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
		"stevearc/aerial.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("kadobot.aerial")
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
		"toppair/reach.nvim",
		opts = {
			{ notifications = true },
		},
		keys = {
			{ "'", ":ReachOpen marks<CR>" },
			{
				"<leader>bb",
				function()
					require("reach").buffers({ handle = "dynamic" })
				end,
				desc = "Buffer Explorer",
			},
			{ "<leader>m", ":ReachOpen marks<CR>", desc = "Marks" },
		},
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
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			require("mini.bufremove").setup()
		end,
		keys = {
			{ "<space>bd", "<cmd>lua MiniBufremove.delete()<cr>", desc = "Delete buffer" },
			{ "<leader>z", "<cmd>lua MiniBufremove.unshow_in_window()<cr>", desc = "Unshow buffer in window" },
			{ "<leader>Z", "<cmd>lua MiniBufremove.unshow()<cr>", desc = "Unshow buffer" },
		},
	},
	{
		"dawsers/edit-code-block.nvim",
		opts = { wincmd = "split" },
	},
}

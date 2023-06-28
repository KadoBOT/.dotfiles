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
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = true,
					keys = { "f", "F", "t", "T", "," },
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
			{
				"r",
				mode = "o",
				function()
					-- jump to a remote location to execute the operator
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "n", "o", "x" },
				function()
					-- show labeled treesitter nodes around the search matches
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
		},
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("kadobot.lspsaga")
		end,
		keys = {
			{ "K", "<cmd>Lspsaga hover_doc<CR>" },
			{ "ga", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
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
		"stevearc/aerial.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("kadobot.aerial")
		end,
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
	{ "wellle/targets.vim" },
	{
		"nvim-pack/nvim-spectre",
		config = function()
			vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>', {
				desc = "Open Spectre",
			})
			vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
				desc = "Search on current file",
			})
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
}

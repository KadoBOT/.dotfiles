return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		tag = "v4.1.0",
		config = function()
			require("kadobot.bufferline")
		end,
		keys = {
			{ "<leader>bp", ":BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", ":BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<C-p>", ":BufferLineCyclePrev<CR>" },
			{ "<C-n>", ":BufferLineCycleNext<CR>" },
		},
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("kadobot.alpha")
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
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			"tpope/vim-fugitive",
		},
		config = function()
			require("kadobot.lualine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kadobot.kanagawa")
		end,
		lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = false,
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
		keys = {
			{ "<leader>hc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>hs", "<cmd>Telescope search_history<cr>", desc = "Search History" },
			{ "<leader>hf", "<cmd>Telescope oldfiles<cr>", desc = "Files History" },
			-- ["'"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Fuzzy Find" },
			{
				"<leader>ff",
				function()
					local opts = {}
					local ok = pcall(require("telescope.builtin").git_files, opts)
					if not ok then
						require("telescope.builtin").find_files(opts)
					end
				end,
				"Find Files",
			},
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
			-- ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>ft", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
			{ "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>cl", "<cmd>Telescope treesitter<cr>", desc = "Treesitter List" },
			{ "<leader>cS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>fp", "<cmd>Telescope project<cr>", desc = "Projects" },
			{ "<leader>fx", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>gt", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Buffer Commits" },
		},
		cmd = "Telescope",
	},
}

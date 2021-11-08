local wk = require('which-key')

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        use_less = true,
        winblend = 0,
        file_ignore_patterns = { "%.git", "node_modules/" },
        prompt_prefix = "   ",
        selection_caret = " ",
        mappings = {
            n = {
                ["j"] = require("telescope.actions").move_selection_previous,
                ["h"] = require("telescope.actions").move_selection_next,
                ["<leader>"] = require("telescope.actions").which_key
            }
        }
    },
    extensions = {
        frecency = {
            ignore_patterns = {"*%.git/*", "*/node_modules/*", "*/tmp/*", "*cache/*"},
            workspaces = {
                ["projects"] = "/home/ricardoa/Projects/",
                ["go"] = "/home//ricardoa/Projects/go",
                ["dotfiles"] = "/home/ricardoa/Projects/%.dotfiles",
                ["ts"] = "/home/Projects/ricardoa/typescript",
            }
        }
    },
    pickers = {
        find_files = {
            find_command = {
                'rg', '--files', '--hidden', '-g', '!.git/', '-g', '!node_modules'
            }
        },
        file_browser = {
            hidden = true
        },
        buffers = {
            show_all_buffers = true
        }
    }
})

require('telescope').load_extension('frecency')
require('telescope').load_extension('project')

wk.register({
    ['<leader>h'] = { name = "History" },
    ['<leader>hc'] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ['<leader>hs'] = { "<cmd>Telescope search_history<cr>", "Search History" },
    ['?'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Fuzzy Find" },
    ['<leader>f'] = { name = "Files" },
    ['<leader>ff'] = { "<cmd>Telescope find_files<cr>", "Find Files" },
    ['<leader>fr'] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    ['<leader>fb'] = { "<cmd>Telescope buffers<cr>", "Buffers" },
    ['<leader>fh'] = { '<cmd>Telescope help_tags<cr>', "Help Tags" },
    ['<leader>fg'] = { '<cmd>Telescope live_grep<cr>', "Live Grep" },
    ['<leader>ft'] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
    ['<leader>cs'] = { '<cmd>Telescope lsp_document_symbols<cr>', "Document Symbols"},
    ['<leader>cS'] = { '<cmd>Telescope lsp_workspace_symbols<cr>', "Workspace Symbols"},
    ['<leader>fp'] = { '<cmd>Telescope project<cr>', "Projects"},
    ['<leader>g'] = { name = "Git" },
    ['<leader>gb'] = { '<cmd>Telescope git_branches<cr>', "Branches"},
    ['<leader>gt'] = { '<cmd>Telescope git_stash<cr>', "Stash"},
    ['<leader>gf'] = { '<cmd>Telescope git_files<cr>', "Files"},
    ['<leader>gs'] = { '<cmd>Telescope git_status<cr>', "Status"},
    ['<leader>gc'] = { '<cmd>Telescope git_commits<cr>', "Commits"},
    ['<M-c>'] = { '<cmd>Telescope commands<cr>', "Commands"},
    ['<C-Space>'] = { '<cmd>Telescope frecency<cr>', "Frecency"},
})

-- Highlights
vim.highlight.create('TelescopeMatching', {guifg='#F18F91'}, false)
vim.highlight.create('TelescopeSelection', {guibg='#2F2A4F', gui='bold'}, false)
vim.highlight.create('TelescopeNormal', {guifg='#C5C0E0'}, false)

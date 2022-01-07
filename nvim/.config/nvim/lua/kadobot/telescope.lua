require("telescope").setup({
    defaults = {
        layout_strategy = 'flex',
        scroll_strategy = 'cycle',
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        use_less = true,
        winblend = 0,
        file_ignore_patterns = { "%.git", "node_modules/", "dist/", "reports/" },
        prompt_prefix = "   ",
        selection_caret = " ",
        mappings = {
            n = {
                ["j"] = require("telescope.actions").move_selection_previous,
                ["h"] = require("telescope.actions").move_selection_next,
                ["<leader>"] = require("telescope.actions").which_key,
            }
        },
        vimgrep_arguments = {
            'rg',
            '--ignore',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '-u'
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,
            use_highlighter = true
        },
        frecency = {
            ignore_patterns = {"*%.git/*", "*/node_modules/*", "*/tmp/*", "*cache/*"},
            workspaces = {
                ["projects"] = "/home/ricardoa/Projects/",
                ["go"] = "/home//ricardoa/Projects/go",
                ["dotfiles"] = "/home/ricardoa/Projects/%.dotfiles",
                ["ts"] = "/home/Projects/ricardoa/typescript",
            }
        },
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
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
        },
        oldfiles = {
            only_cwd = true
        }
    }
})

require('telescope').load_extension('frecency')
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('aerial')

-- Highlights
vim.highlight.create('TelescopeMatching', {guifg='#F18F91'}, false)
vim.highlight.create('TelescopeSelection', {guibg='#2F2A4F', gui='bold'}, false)
vim.highlight.create('TelescopeNormal', {guifg='#C5C0E0'}, false)

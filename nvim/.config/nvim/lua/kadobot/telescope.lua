require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        use_less = true,
        winblend = 0,
        file_ignore_patterns = { ".git", "node_modules" },
        prompt_prefix = "   ",
        selection_caret = " "
    },
    extensions = {
        frecency = {
            ignore_patterns = {"*.git/*", "*/node_modules/*", "*/tmp/*", "*cache/*"},
            workspaces = {
                ["projects"] = "/home/ricardoa/Projects/",
                ["go"] = "/home//ricardoa/Projects/go",
                ["dotfiles"] = "/home/ricardoa/Projects/.dotfiles",
                ["ts"] = "/home/Projects/ricardoa/typescript",
            }
        }
    },
    pickers = {
        find_files = {
            find_command = {
                'rg', '--files', '--hidden', '-g', '!.git', '-g', '!node_modules'
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

vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ft', "<cmd>Telescope file_browser<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>Telescope lsp_code_actions<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>Telescope lsp_definitions<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ci', '<cmd>Telescope lsp_implementations<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>Telescope lsp_document_diagnostics<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cR', '<cmd>Telescope lsp_references<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cs', '<cmd>Telescope lsp_document_symbols<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cD', '<cmd>Telescope lsp_workspace_diagnostics<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cS', '<cmd>Telescope lsp_workspace_symbols<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>Telescope git_stash<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-c>', '<cmd>Telescope commands<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Space>', '<cmd>Telescope frecency<cr>', {noremap = true})

-- Highlights
vim.highlight.create('TelescopeMatching', {guifg='#F18F91'}, false)
vim.highlight.create('TelescopeSelection', {guibg='#2F2A4F', gui='bold'}, false)
vim.highlight.create('TelescopeNormal', {guifg='#C5C0E0'}, false)

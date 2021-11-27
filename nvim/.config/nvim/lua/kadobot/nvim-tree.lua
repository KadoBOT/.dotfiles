local ntree = require'nvim-tree'
local wk = require'which-key'
local g = vim.g

g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
g.nvim_tree_git_hl = 1  -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_refresh_wait = 300

g.nvim_tree_special_files = {}
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★',
        deleted = '',
        ignored = '◌',
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = '',
    },
    lsp = {
        hint = '',
        info = '',
        warning = '',
        error = '',
    },
}

g.nvim_tree_respect_buf_cwd = 1

wk.register({
    [";"] = {":NvimTreeToggle<CR>", "Open"},
})

wk.register({
    name = "Tree",
    ["t"] = {":NvimTreeToggle<CR>", "Open"},
    ["f"] = {":NvimTreeFindFile<CR>", "Find File"},
    ["r"] = {":NvimTreeRefresh<CR>", "Refresh"},
}, { prefix = "<leader>t"})

ntree.setup{
    auto_close = true,
    diagnostics = {
        enable = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    view = {
        side = 'right',
        auto_resize = true,
        width = 50
    }
}

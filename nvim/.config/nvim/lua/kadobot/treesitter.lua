require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = { enable = true,
        keymaps = {
            init_selection = '<TAB>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        }
    },
    refactor = {
        highlight_definitions = { enable = true },
    },
    textobjects = { enable = true }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        use_languagetree = true
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
        highlight_current_scope = { enable = true },
    },
    textobjects = { enable = true },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true
    }
}

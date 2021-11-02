require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = { enable = true },
    refactor = {
        highlight_definitions = { enable = true },
    },
    textobjects = { enable = true }
}

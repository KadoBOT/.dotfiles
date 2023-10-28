require'nvim-treesitter.configs'.setup {
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = false,
        },
        refactor = {
            highlight_current_scope = { enable = true },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "gr"
                }
            },
            navigation = {
                enable= true,
                keymaps = {
                    goto_definition = "gD",
                    list_definition = "gL",
                    list_definition_toc = "gO",
                    goto_next_usage = "gn",
                    goto_previous_usage = "gp"
                }
            }
        }
    },
}

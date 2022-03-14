local wk = require('which-key')
local aerial = require('aerial')

wk.register({
    ['ka'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold"})<cr>', "Fold"},
    ['kA'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "recurse"})<cr>', "Recursive Fold"},
    ['kr'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "bubble"})<cr>', "Fold All"},
    ['kR'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "bubble", "recurse"})<cr>', "Recursive Fold All"},
})

aerial.setup({
    default_direction = "left",
    default_bindings = false,
    min_width = 50,
    on_attach = function (bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with '[[' or ']]'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
    end
})

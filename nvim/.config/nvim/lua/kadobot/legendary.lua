local wk = require('which-key')

require('legendary').setup{}

wk.register({
    name = "Legendary",
    ['f'] = { ":Legendary<CR>", "Find" },
    ['k'] = { ":Legendary keymaps<CR>", "Find Keymap" },
    ['c'] = { ":Legendary commands<CR>", "Find Commands" },
    ['a'] = { ":Legendary autocmds<CR>", "Find Autocmds" },
}, { prefix = "<leader>l" })

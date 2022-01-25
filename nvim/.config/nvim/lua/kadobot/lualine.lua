-- local status = require'nvim-spotify'.status

-- status:start()

require('lualine').setup {
    options = {
        theme = 'kanagawa',
        disabled_filetypes = { 'TelescopePrompt', 'vista' }
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            {'diagnostics', sources={'nvim_diagnostic'}}
        },
        lualine_c = {
            {
                'filename',
                path = 1,
            }        
        }
    },
    extensions = {
        "fugitive",
        "fzf",
        "nvim-tree",
    }
}

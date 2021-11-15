require('lualine').setup {
    options = {
        theme = 'dracula'
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            {'diagnostics', sources={'nvim_lsp'}}
        },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        }
    },
    extensions = {'fugitive'}
}

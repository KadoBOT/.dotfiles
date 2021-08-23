vim.g.lightline = {
    colorscheme = 'breakingbad',
    enable = {
        statusline = 1,
        tabline = 1,
    },
    active = {
		   left = {{ 'mode', 'paste' }, { 'fugitive', 'filename' }}
    },
    separator = {
        left = '',
        right = '',
    },
    subseparator = {
        left = '',
        right = '',
    },
    tabline_separator = {
        left = '',
        right = '',
    },
    tabline_subseparator = {
        left = '',
        right = '',
    },
}


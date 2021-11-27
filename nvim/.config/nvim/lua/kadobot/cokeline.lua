local get_hex = require('cokeline/utils').get_hex
local wk = require('which-key')

require('cokeline').setup({
    default_hl = {
        focused = {
            fg = get_hex('Normal', 'fg'),
            bg = get_hex('ColorColumn', 'bg'),
        },
        unfocused = {
            fg = get_hex('Comment', 'fg'),
            bg = get_hex('ColorColumn', 'bg'),
        },
    },

    components = {
        {
            text = '⎹',
            hl = {
                fg = function(buffer)
                    if buffer.diagnostics.errors ~= 0 then
                        return get_hex('Error', 'fg')
                    end
                    if buffer.diagnostics.warnings ~= 0 then
                        return get_hex('WarningMsg', 'fg')
                    end
                end,

            },
        },
        {
            text = function(buffer) return ' ' .. buffer.devicon.icon end,
            hl = {
                fg = function(buffer) return buffer.devicon.color end,
            },
        },
        {
            text = function(buffer) return buffer.index .. ': ' end,
        },
        {
            text = function(buffer) return buffer.unique_prefix end,
            hl = {
                fg = get_hex('Comment', 'fg'),
                style = 'italic',
            },
        },
        {
            text = function(buffer) return buffer.filename end,
            hl = {
                style = function(buffer)
                    local style
                    if buffer.is_focused then
                        style = 'bold'
                    end
                    if buffer.diagnostics.errors ~= 0 then
                        if style then
                            style = style .. ',underline'
                        else
                            style = 'underline'
                        end
                    end
                    return style
                end,
            },
        },
        {
            text = function (buffer)
                if buffer.is_modified then
                    return ' ● '
                end
                return ' ○ '
            end,
            hl = {
                fg = function (buffer)
                    if buffer.is_modified then
                        return get_hex('WarningMsg', 'fg')
                    end
                end,
            },
            delete_buffer_on_left_click = true,
        }
    },
})

wk.register({
    name = "Buffer",
    ['p'] = { '<Plug>(cokeline-focus-prev)', "Previous Buffer" },
    ['n'] = { '<Plug>(cokeline-focus-next)', "Next Buffer" },
    ['c'] = { ':bd<CR>', "Close Buffer" },
    ['1'] = { '<Plug>(cokeline-focus-1)', "Buffer 1" },
    ['2'] = { '<Plug>(cokeline-focus-2)', "Buffer 2" },
    ['3'] = { '<Plug>(cokeline-focus-3)', "Buffer 3" },
    ['4'] = { '<Plug>(cokeline-focus-4)', "Buffer 4" },
    ['5'] = { '<Plug>(cokeline-focus-5)', "Buffer 5" },
    ['6'] = { '<Plug>(cokeline-focus-6)', "Buffer 6" },
    ['7'] = { '<Plug>(cokeline-focus-7)', "Buffer 7" },
    ['8'] = { '<Plug>(cokeline-focus-8)', "Buffer 8" },
    ['9'] = { '<Plug>(cokeline-focus-9)', "Buffer 9" }
}, { prefix = "<leader>b" })

wk.register({
  ['<C-p>'] = { '<Plug>(cokeline-focus-prev)', "Previous Buffer" },
  ['<C-n>'] = { '<Plug>(cokeline-focus-next)', "Next Buffer" },
})

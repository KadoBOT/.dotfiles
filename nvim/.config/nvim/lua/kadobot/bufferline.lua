require('bufferline').setup{
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "[" .. count .. "]"
        end,
    }
}

local wk = require('which-key')

wk.register({
  name = "Buffer",
  ['p'] = { ':BufferLineCyclePrev<CR>', "Previous Buffer" },
  ['n'] = { ':BufferLineCycleNext<CR>', "Next Buffer" },
  ['c'] = { ':BufferLineClosePick<CR>', "Close Buffer" },
  ['1'] = { ':BufferLineGoToBuffer 1<CR>', "Buffer 1" },
  ['2'] = { ':BufferLineGoToBuffer 2<CR>', "Buffer 2" },
  ['3'] = { ':BufferLineGoToBuffer 3<CR>', "Buffer 3" },
  ['4'] = { ':BufferLineGoToBuffer 4<CR>', "Buffer 4" },
  ['5'] = { ':BufferLineGoToBuffer 5<CR>', "Buffer 5" },
  ['6'] = { ':BufferLineGoToBuffer 6<CR>', "Buffer 6" },
  ['7'] = { ':BufferLineGoToBuffer 7<CR>', "Buffer 7" },
  ['8'] = { ':BufferLineGoToBuffer 8<CR>', "Buffer 8" },
  ['9'] = { ':BufferLineGoToBuffer 9<CR>', "Buffer 9" }
}, { prefix = "<leader>b" })

wk.register({
  ['<C-p>'] = { ':BufferLineCyclePrev<CR>', "Previous Buffer" },
  ['<C-n>'] = { ':BufferLineCycleNext<CR>', "Next Buffer" },
})

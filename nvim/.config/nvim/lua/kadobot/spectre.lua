local wk = require('which-key')

wk.register({
    name = "Search Panel",
    ["w"] = {":lua require'spectre'.open_visual({select_word=true})<CR>", "Open"},
    ["p"] = {":lua require'spectre'.open_file_search()<CR>", "File Search"}
}, { prefix = "<leader>s", mode = "n" })

wk.register({
    name = "Search Panel",
    ["s"] = {":lua require'spectre'.open_visual()<CR>", "Visual"}
}, { prefix = "<leader>", mode = "v" })

wk.register({
    ["S"] = {":lua require'spectre'.open()"}
})

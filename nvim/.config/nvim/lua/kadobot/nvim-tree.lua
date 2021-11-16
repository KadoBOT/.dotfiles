local ntree = require'nvim-tree'
local wk = require'which-key'

wk.register({
    [";"] = {":NvimTreeToggle<CR>", "Open"},
})

wk.register({
    name = "Tree",
    ["t"] = {":NvimTreeToggle<CR>", "Open"},
    ["f"] = {":NvimTreeFindFile<CR>", "Find File"},
    ["r"] = {":NvimTreeRefresh<CR>", "Refresh"},
}, { prefix = "<leader>t"})

ntree.setup{}

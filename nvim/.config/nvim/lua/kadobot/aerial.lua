local wk = require('which-key')

vim.g.aerial = {
    default_direction = "prefer_left"
}

wk.register({
    ['ka'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold"})<cr>', "Fold"},
    ['kA'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "recurse"})<cr>', "Recursive Fold"},
    ['kr'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "bubble"})<cr>', "Fold All"},
    ['kR'] = {'<cmd>lua require("aerial").tree_cmd("toggle", {"fold", "bubble", "recurse"})<cr>', "Recursive Fold All"},
})

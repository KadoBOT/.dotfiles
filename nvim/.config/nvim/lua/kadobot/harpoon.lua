local wk = require('which-key')

local nav = {
    name = "Marks",
    ['m'] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Marks Menu" },
    ['c'] = { "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", "Commands Menu" },
    ['a'] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add file" },
    ["n"] = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Mark" },
    ["p"] = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Prev Mark" },
    ['t'] = { "<cmd>Telescope harpoon marks<cr>", "Telescope" },
    ["$"] = {
        name = "Terminal"
    }
}

for var=1,10 do
    nav[tostring(var%10)] = {string.format("<cmd>lua require('harpoon.ui').nav_file(%s)<CR>", var), string.format("File %s", var)}
    nav["$"][tostring(var%10)] = {string.format("<cmd>lua require('harpoon.tmux').gotoTerminal(%s)<CR>", var), string.format("Terminal %s", var)}
end

wk.register(nav, { prefix = "<leader>m" })

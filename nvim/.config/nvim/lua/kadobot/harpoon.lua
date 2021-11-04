local wk = require('which-key')
local hp = require'harpoon'

hp.setup{
  projects = {
    ["$HOME/Projects/Infra-Caps-Services/lambda/Localisation-Workflow"] = {
      term = {
        cmds = {
          "perform get-okta-aws-keys",
          "serverless deploy --stage dev --region us-west-2",
          "npm run test"
        }
      }
    }
  }
}

wk.register({
  name = "Marks",
  ['m'] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
  ['t'] = {
    name = "Terminal",
    ["m"] = { "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", "Terminal" },
    ["1"] = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", "Go to 1" },
    ["2"] = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>", "Go to 2" },
    ["3"] = { "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>", "Go to 3" },
    ["4"] = { "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>", "Go to 4" },
    ["5"] = { "<cmd>lua require('harpoon.term').gotoTerminal(5)<CR>", "Go to 5" },
    ["6"] = { "<cmd>lua require('harpoon.term').gotoTerminal(6)<CR>", "Go to 6" },
    ["7"] = { "<cmd>lua require('harpoon.term').gotoTerminal(7)<CR>", "Go to 7" },
    ["8"] = { "<cmd>lua require('harpoon.term').gotoTerminal(8)<CR>", "Go to 8" },
    ["9"] = { "<cmd>lua require('harpoon.term').gotoTerminal(9)<CR>", "Go to 9" },
    ["0"] = { "<cmd>lua require('harpoon.term').gotoTerminal(0)<CR>", "Go to 0" },
  }
}, { prefix = "<leader>m"})

wk.register({
  ['"'] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Mark file"},
})

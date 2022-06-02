require("feline").setup({
  highlight_reset_triggers = {},
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
      "LspTrouble",
      "qf",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
  disable = {
    filetypes = {
      "dashboard",
      "startify",
    },
  },
})

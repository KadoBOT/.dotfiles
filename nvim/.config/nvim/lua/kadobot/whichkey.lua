-- vim.g.which_key_centered = 0
-- vim.g.which_key_use_floating_win = 0
-- vim.g.which_key_floating_relative_win = 0
-- vim.g.which_key_max_size = 7
-- vim.g.which_key_hspace = 5
-- vim.g.which_key_disable_default_offset = 0

local M = {
  ["<leader"] = {
    ["<C-^>"] = "which_key_ignore",
    ["<leader>"] = "which_key_ignore"
  },
  t = {
    name = '+Tree',
    u = "Undo",
  },
  ['='] = {
    name = '+Workspace',
    r = 'Remove Folder',
    l = 'List Folders',
  },
  w = {
    name = '+Window',
    h = 'Horizontal Split',
    v = 'Vertical Split',
    c = 'Close',
  },
  g = {
    name = '+Git',
    h = {
      name = '+Hunk',
      p = 'Preview',
      s = 'Stage',
      u = 'Undo',
    },
  },
  n = {
    name = '+NERDCommenter',
  },
  p = 'which_key_ignore',
  P = 'which_key_ignore',
  b = {
    name = 'Buffer',
    p = 'Previous',
    n = 'Next',
    c = 'Close',
    b = 'List',
    o = 'Old Files'
  },
  h = {
    name = 'History',
    c = 'Command',
    s = 'Search'
  }
}

require('which-key').register(M, { prefix = "<leader>" })

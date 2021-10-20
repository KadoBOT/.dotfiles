vim.g.which_key_centered = 0
vim.g.which_key_use_floating_win = 0
vim.g.which_key_floating_relative_win = 0
vim.g.which_key_max_size = 7
vim.g.which_key_hspace = 5
vim.g.which_key_disable_default_offset = 0

vim.g.which_key_map = {
  f = {
    name = '+Files',
    f = "Find",
    b = "Buffer",
    g = "Grep",
    h = "Help Tags",
    t = "Browser",
  },
  t = {
    name = '+Tree',
    u = "Undo",
  },
  c = {
    name = '+Code',
    f = 'Format',
    a = 'Action',
    e = 'Definitions',
    i = 'Implementations',
    d = 'Document Diagnostics',
    D = 'Workspace Diagnostics',
    R = 'References',
    r = 'Rename',
    s = 'Document Symbols',
    S = 'Workspace Symbols',
    q = 'Quickfix',
    l = 'Location List'
  },
  ['='] = {
    name = '+Workspace',
    a = 'Add Folder',
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
    b = 'Branches',
    t = 'Stash',
    f = 'Files',
    s = 'Status',
    c = 'Commits',
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

vim.fn['which_key#register']('<Space>', "g:which_key_map")

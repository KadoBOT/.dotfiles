local o = vim.opt
local w = vim.wo

vim.cmd('colorscheme doom-one')

o.autoindent = true
o.autoread = true
o.background = "dark"
o.backspace = "indent,eol,start"
o.backup = false
o.bomb = false
o.clipboard = "unnamedplus"
o.completeopt = "menuone,noinsert,noselect"
o.confirm = true
o.cursorline = true
o.display:append { "lastline" }
o.encoding = "utf-8"
o.errorbells = false
o.expandtab = true
o.fileformats:append { "mac" }
o.foldenable = false
o.foldmethod = "indent"
o.foldnestmax = 3
o.formatoptions:append { j  = true }
o.gdefault = true
o.hidden = true
o.hlsearch = false
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.lazyredraw = true
o.laststatus = 2
o.linebreak = true
o.list = true
o.listchars = "tab:>·,trail:~,extends:>,precedes:<,space:·"
o.modeline = false
o.mouse = "a"
o.nrformats:remove { "octal" }
w.number = true
o.numberwidth = 2
o.relativenumber = false
o.ruler = false
o.scrolloff = 12
o.shell = "/bin/zsh"
o.shiftround = true
o.shiftwidth = 2
o.shortmess:append { c = true }
o.showmatch = true
o.showmode = true
o.sidescroll = 12
o.sidescrolloff = 7
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.spell = true
o.spelllang = "en_us"
o.splitbelow = true
o.splitright = true
o.startofline = false
o.syntax = 'enable'
o.swapfile = false
o.tabstop = 8
o.termguicolors = true
o.timeoutlen = 500
o.title = true
o.updatetime = 100
o.visualbell = true
o.wildignore:append { "**/.git/*" }
o.wildignore:append { "**/node_modules/*" }
o.wildmenu = true
o.wildmode = "full,list:longest"
o.wrap = false
o.writebackup = false

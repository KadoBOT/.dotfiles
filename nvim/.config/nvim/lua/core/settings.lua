local o = vim.opt
local w = vim.wo
local g = vim.g

vim.cmd('colorscheme tokyonight')

o.autoindent = true
o.autoread = true
o.background = "dark"
o.backspace = {"indent", "eol,start"}
o.backup = false
o.bomb = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = "menu,menuone,noselect"
o.confirm = true
o.cursorline = true
o.display:append { "lastline" }
o.encoding = "utf-8"
o.errorbells = false
o.expandtab = true
o.fileformats:append { "mac" }
o.foldenable = false
o.foldlevel = 1
o.foldlevelstart = 90
o.foldmethod = "indent"
o.foldnestmax = 10
o.formatoptions:append { j  = true }
o.gdefault = true
o.history = 1000
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.lazyredraw = false
o.laststatus = 2
o.linebreak = true
o.list = true
o.listchars = {
  tab = "→ ",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}
o.magic = true
o.mat = 2
o.matchpairs:append { "<:>,「:」,『:』,【:】,“:”,‘:’,《:》" }
o.modeline = false
o.mouse = "a"
o.nrformats:remove { "octal" }
w.number = true
o.numberwidth = 2
o.relativenumber = false
o.ruler = false
o.scrolloff = 12
o.shell = vim.env.SHELL
o.shiftround = true
o.shiftwidth = 4
o.shortmess = "atToOFc"
o.showbreak = "↪"
o.showcmd = true
o.showmatch = true
o.showmode = false
o.sidescroll = 12
o.sidescrolloff = 7
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.spell = true
o.spelllang = "en_us"
o.splitbelow = true
o.splitright = true
o.softtabstop = 4
o.startofline = false
o.syntax = 'enable'
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 120
o.timeoutlen = 500
o.title = true
o.ttyfast = true
o.updatetime = 300
o.visualbell = true
o.wildignore:append { "**/.git/*" }
o.wildignore:append { "**/node_modules/*" }
o.wildmenu = true
o.wildmode = "full,list:longest"
o.wrap = true
o.wrapmargin = 8
o.writebackup = false

vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logiPat",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "rrhelper",
    "tar",
    "tarPlugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


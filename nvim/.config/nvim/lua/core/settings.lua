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
o.breakindent = true
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = "menuone,noselect,noinsert"
o.confirm = true
o.cursorline = true
o.display:append { "lastline" }
o.encoding = "utf-8"
o.errorbells = false
o.expandtab = true
o.fileformats:append { "mac" }
o.fillchars:append("vert:│")
-- o.foldenable = false
-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldlevel = 20
o.foldlevelstart = 99
o.foldmethod = "indent"
o.foldminlines = 1
o.foldnestmax = 3
o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]
o.formatoptions:remove {'a','t','o','2'}
o.formatoptions:append('cqrnj')
o.grepprg = [[rg --vimgrep --no-heading --smart-case]]
o.history = 1000
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "split"
o.incsearch = true
o.lazyredraw = true
o.laststatus = 2
o.linebreak = true
o.list = true
o.listchars = {
    tab = '▷─',
    trail = '·',
    space = ' ',
    eol = '↲',
    nbsp = '⦸',
    extends = '',
    precedes = '',
    conceal = '┊'
}
o.magic = true
o.mat = 2
o.matchpairs:append { "<:>,「:」,『:』,【:】,“:”,‘:’,《:》" }
o.modeline = false
o.mouse = "nicr"
o.nrformats:remove { "octal" }
w.number = true
o.numberwidth = 2
o.path = '.,**'
o.pumheight = 15
o.pumblend = 17
o.relativenumber = false
o.ruler = false
o.scrolloff = 12
o.shell = vim.env.SHELL
o.shiftround = true
o.shiftwidth = 4
o.shortmess:append("aIc")
o.showbreak = string.rep(' ', 4)
o.showcmd = true
o.showmatch = true
o.showmode = false
o.sidescroll = 12
o.sidescrolloff = 15
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
o.synmaxcol = 512
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 120
o.timeoutlen = 500
o.title = true
o.ttyfast = true
o.updatetime = 200
o.visualbell = true
o.wildignore:append { "**/.git/*" }
o.wildignore:append { "**/node_modules/*" }
o.wildmenu = true
-- o.wildmode:append {"full,longest"}
o.wildoptions = 'pum'
o.wrap = false
o.wrapmargin = 8
o.writebackup = false

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
    filetype plugin indent on
    augroup filetype_yaml
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
    augroup END
]])

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])


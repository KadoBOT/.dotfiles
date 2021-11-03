vim.cmd([[
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
function! LightLineFugitive()
    let branch = fugitive#head()

    return branch !=# '' ? "\ue0a0 " . branch : ''
endfunction
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
]])

vim.g.lightline = {
    colorscheme = 'onedark',
    enable = {
        statusline = 1,
        tabline = 1,
    },
    active = {
        left = {
            { 'mode', 'paste' }, { 'gitbranch','readonly', 'filename', 'modified' }
        },
        right = {
            { 'percent' },
            { 'lineinfo' },
            { 'fileencoding', 'filetype', 'gitstatus' }
        },
    },
    component = {
        lineinfo = '%-3l %-2v',
    },
    component_function = {
        gitstatus = 'GitStatus',
        gitbranch = 'LightLineFugitive',
        filename = 'LightlineFilename'
    },
    separator = {
        left = '',
        right = '',
    },
    subseparator = {
        left = '',
        right = '',
    },
    tabline_separator = {
        left = '',
        right = '',
    },
    tabline_subseparator = {
        left = '',
        right = '',
    },
}

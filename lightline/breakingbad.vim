" =============================================================================
" Filename: autoload/lightline/colorscheme/breakingbad.vim
" Author: kadobot
" License: MIT License
" Last Change: 2021/08/20 12:36:52.
" =============================================================================

let s:base03 = [ '#0C021F', 235 ]
let s:base023 = [ '#13092B', 236 ]
let s:base02 = [ '#261C4D', 238 ]
let s:base01 = [ '#392E66', 240 ]
let s:base00 = [ '#4F438B', 242  ]
let s:base0 = [ '#725EA6', 244 ]
let s:base1 = [ '#8F77B5', 247 ]
let s:base2 = [ '#C5BEE0', 248 ]
let s:base3 = [ '#DFE0F0', 252 ]
let s:yellow = [ '#FEF1F1', 180 ]
let s:orange = [ '#E9888D', 173 ]
let s:red = [ '#D5757C', 203 ]
let s:blue = [ '#8ac6f2', 117 ]
let spanish_pink = [ '#F8B8B7', 216 ]
let s:purple = [ '#13092B', 117 ]
let s:lavender_web = [ '#DFE0F0', 119 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:purple ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:lavender_web ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, spanish_pink ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#breakingbad#palette = lightline#colorscheme#flatten(s:p)

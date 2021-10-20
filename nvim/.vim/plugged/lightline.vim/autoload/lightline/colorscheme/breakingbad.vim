" =============================================================================
" Filename: autoload/lightline/colorscheme/breakingbad.vim
" Author: KadoBOT
" License: MIT License
" Last Change: 2021/10/19 08:37:43.
" =============================================================================
let s:base03 = [ '#0c021f', 235 ]
let s:base023 = [ '#261c4d', 236 ]
let s:base02 = [ '#392e66', 238 ]
let s:base01 = [ '#463a81', 240 ]
let s:base00 = [ '#4f438b', 242  ]
let s:base0 = [ '#8f77b5', 244 ]
let s:base1 = [ '#968cbd', 247 ]
let s:base2 = [ '#aba1d0', 248 ]
let s:base3 = [ '#c5bee0', 252 ]
let s:yellow = [ '#ffe4e3', 180 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 203 ]
let s:magenta = [ '#f2c68a', 216 ]
let s:blue = [ '#725ea6', 117 ]
let s:cyan = s:blue
let s:green = [ '#dfe0f0', 119 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#breakingbad#palette = lightline#colorscheme#flatten(s:p)

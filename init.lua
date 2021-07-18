require('default-config')
require('settings')
require('plugins')
require('lv-utils')
require('keymappings')
require('lv-galaxyline')
-- require('lv-treesitter')
require('lv-which-key')
require('lsp')

vim.g.colors_name = O.colorscheme
vim.g.syntax = true
O.auto_complete = true
O.relative_number = false
O.colorscheme = 'spacegray'
O.timeoutlen = 100
O.leader_key = ' '

-- lua
O.lang.lua.autoformat = false
O.lang.lua.formatter = 'lua-format'

O.lang.tsserver.linter = true 
O.lang.tsserver.autoformat = true

-- json
O.lang.json.autoformat = true

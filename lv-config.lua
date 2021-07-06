-- O is the global options object

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.auto_complete = true
O.relative_number = false
O.colorscheme = 'spacegray'
O.timeoutlen = 100
O.leader_key = ' '

-- After changing plugin config it is recommended to run :PackerCompile
--O.plugin.hop.active = true
--O.plugin.colorizer.active = true
--O.plugin.trouble.active = true
--O.plugin.lazygit.active = true
--O.plugin.markdown_preview.active = true

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true

-- lua
O.lang.lua.autoformat = false
O.lang.lua.formatter = 'lua-format'

-- javascript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = nil
O.lang.tsserver.autoformat = true

-- json
O.lang.json.autoformat = true

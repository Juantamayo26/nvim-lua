local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.cursorline = true
opt.termguicolors = true
opt.list = true

opt.hlsearch = false
opt.incsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.breakindent = true
opt.wrap = false

opt.laststatus = 3

vim.cmd([[let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro"]])

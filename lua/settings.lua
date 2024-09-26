---  HELPERS  ---

local cmd = vim.cmd
local opt = vim.opt
local CACHE_PATH = vim.fn.stdpath('cache')
local TERMINAL = vim.fn.expand('$TERMINAL')
vim.g.mapleader = " "

---  VIM ONLY COMMANDS  ---
cmd('filetype plugin on')               -- filetype detection
cmd('let &titleold="'..TERMINAL..'"')   
cmd('set inccommand=split')             -- show what you are substituting in real time
cmd('set iskeyword+=-')                 -- treat dash as a separate word
cmd("colorscheme gruvbox")

---  SETTINGS  ---
-- opt.mouse           = "a"                       -- allow the mouse to be used in neovim
opt.completeopt     = {'menuone', 'noselect'}
opt.backup          = false
opt.clipboard       = "unnamedplus"             -- allows neovim to access the system clipboard
opt.fileencoding    = "utf-8"                   -- the encoding written to a file
opt.showmode        = false                     -- we don't need to see things like -- INSERT -- anymore
opt.splitbelow      = true                      -- force all horizontal splits to go below current window
opt.splitright      = true                      -- force all vertical splits to go to the right of current window
opt.swapfile        = false                     -- creates a swapfile
opt.termguicolors   = true                      -- set term gui colors (most terminals support this)
opt.undodir         = CACHE_PATH .. '/undo'     -- set an undo directory
opt.undofile        = true                      -- enable persisten undo
-- opt.writebackup     = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited aaaaaaaaaa
opt.expandtab       = true
opt.cursorline      = true
opt.number          = true
opt.relativenumber  = true
opt.shiftwidth      = 2
opt.tabstop         = 2
opt.softtabstop     = 2
opt.smartindent     = true
opt.wrap            = false 
opt.scrolloff       = 8
opt.hidden          = true
opt.updatetime      = 50
opt.shortmess:append("I")                       -- don't pass messages to |ins-completion-menu|
opt.errorbells      = false
--
opt.guifont         = "monospace:h17"           -- the font used in graphical neovim applications
opt.showtabline     = 2                         -- always show tabs
--opt.smartcase       = O.smart_case              -- smart case
opt.titlestring     = "%<%F%=%l/%L - nvim"      -- what the title of the window will be set to
opt.title           = true                      -- set the title of window to the value of the titlestring
opt.signcolumn      = "yes"                     -- always show the sign column, otherwise it would shift the text each time
opt.pumheight       = 10                        -- pop up menu height

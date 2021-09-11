-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A->>', ':BufferLineMoveNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-p>', ':BufferLinePick<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')

-- Competitive Programming
-- vim.api.nvim_set_keymap('n', '<F5>', ':!g++ -std=c++17 % -static -Wall -Wno-unused-result -O2 -o %:r<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<F6>', ':!g++ -std=c++17 % -static -Wall -Wno-unused-result -O2 -o %:r && ./%:r < %:p:h/in<CR>', {noremap = true, silent = true})
--
vim.api.nvim_set_keymap('n', '<F5>', ':TermExec cmd="g++ -std=c++17 % -static -Wall -Wno-unused-result -O2 -o %:r && ./%:r"<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', ':TermExec cmd="g++ -std=c++17 % -static -Wall -Wno-unused-result -O2 -o %:r && ./%:r < %:p:h/in"<CR>', {noremap = true, silent = true})

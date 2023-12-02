vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--Line numbers
vim.wo.number = true

vim.cmd('setlocal signcolumn=yes')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Copy to clipboard
vim.keymap.set('n','y','"+y')
vim.keymap.set('n','yy','"+yy')
vim.keymap.set('n','Y','"+Y')
vim.keymap.set('x','y','"+y')
vim.keymap.set('x','Y','"+Y')

-- Move lines
vim.keymap.set('n','<C-j>',':m .+1<CR>==')
vim.keymap.set('n','<C-k>',':m .-2<CR>==')

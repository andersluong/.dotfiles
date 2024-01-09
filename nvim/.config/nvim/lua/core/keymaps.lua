vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

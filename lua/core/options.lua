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

-- Keep warning/error signs
vim.o.signcolumn = 'yes'
vim.diagnostic.config({
  update_in_insert = true,
})

-- Line numbers
vim.wo.number = true

-- Mouse move
vim.opt.mouse = "a"

-- Stop comments from going to the next line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

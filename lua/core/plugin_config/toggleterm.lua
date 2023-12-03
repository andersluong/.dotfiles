require("toggleterm").setup{
  start_in_insert = true,
}

vim.keymap.set('n', 'gt', ':ToggleTerm<CR>')
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'gt', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd("autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif")

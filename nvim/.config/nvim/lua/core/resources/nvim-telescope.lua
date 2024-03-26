return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local builtin = require('telescope.builtin')

      -- vim.keymap.set('n', '<c-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
      -- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end,
  }
}

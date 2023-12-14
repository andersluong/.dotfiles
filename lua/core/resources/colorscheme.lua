return {
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd('colorscheme github_dark_default')
  --   end,
  -- },
  {
    'decaycs/decay.nvim',
    name = "decay",
    lazy = false,
    priority = 1000,
    config = function()
      require('decay').setup({
        style = 'default',
        nvim_tree = {
          contrast = false, -- or false to disable tree contrast
        },
      })
    end,
  },
}

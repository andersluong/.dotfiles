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
      local core = require 'decay.core'

      local colors = core.get_colors("default")
      require('decay').setup({
        style = 'default',
        nvim_tree = {
          contrast = true, -- or false to disable tree contrast
        },
        -- cmp = {
        --   block_kind = false,
        -- },
        italics = {
          code = false,
          comments = false,
        },
        override = {
          ["@punctuation.bracket"] = { fg = colors.white --[[ "#434848" ]] },
        }
      })
    end,
  },
}

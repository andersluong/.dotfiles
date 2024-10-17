return {
  {
    'decaycs/decay.nvim',
    name = "decay",
    lazy = false,
    priority = 1000,
    config = function()
      local core = require 'decay.core'
      local util = require 'decay.util'

      local colors = core.get_colors("default")
      require('decay').setup({
        style = 'default',
        nvim_tree = {
          contrast = false, -- or false to disable tree contrast
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
          FloatBorder = { fg = colors.white },
          TelescopeBorder = { fg = colors.white, bg = util.darken(colors.white, 0.2) },
          NormalFloat = { bg = util.darken(colors.foreground, 0.3) },
          DiagnosticVirtualTextError = { bg = util.darken(colors.red, 0.2), fg = colors.red },
          DiagnosticVirtualTextWarn = { bg = util.darken(colors.yellow, 0.2), fg = colors.yellow },
          DiagnosticVirtualTextInfo = { bg = util.darken(colors.blue, 0.2), fg = colors.blue },
          DiagnosticVirtualTextHint = { bg = util.darken(colors.cyan, 0.2), fg = colors.cyan },
          Search = { fg = colors.background, bg = colors.blue },
          IncSearch = { fg = colors.background, bg = colors.blue },
        }
      })
    end,
  },
}

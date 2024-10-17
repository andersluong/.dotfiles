return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup{
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        -- map('n', 'n', function()
        --   if vim.wo.diff then
        --     vim.cmd.normal({'n', bang = true})
        --   else
        --     gitsigns.nav_hunk('next')
        --   end
        -- end)
        --
        -- map('n', 'p', function()
        --   if vim.wo.diff then
        --     vim.cmd.normal({'p', bang = true})
        --   else
        --     gitsigns.nav_hunk('prev')
        --   end
        -- end)

        -- Actions
        map('n', '<leader>p', gitsigns.preview_hunk)
      end
    }
  end,
}

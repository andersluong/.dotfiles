return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
        },
        -- A list of parser names, or "all"
        ensure_installed = {
          "vimdoc",
          "luadoc",
          "vim",
          "lua",
          "markdown"
        },
        -- indent = {
        --   enable = true,
        -- },
      }
    end,
  },
}

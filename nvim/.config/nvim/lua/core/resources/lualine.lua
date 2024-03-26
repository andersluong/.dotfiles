return {
  {
    "nvim-lualine/lualine.nvim",
    -- event = "VeryLazy",
    config = function(_, _)
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'decay',
          -- section_separators = '',
          component_separators = ''
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'encoding', { "fileformat", symbols = { unix = "" } } , 'filetype' },
          lualine_z = { 'progress' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        }
      }
    end,
  },
}

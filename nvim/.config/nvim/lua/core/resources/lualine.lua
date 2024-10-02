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
          component_separators = '',
          disabled_filetypes = { 'packer', 'NvimTree' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'branch',
              icon = '',
            },
            'diff',
            'diagnostics',
          },
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {},
          lualine_y = { 'encoding', { "fileformat", symbols = { unix = "" } } , 'filetype', 'location' },
          lualine_z = { 'progress' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}

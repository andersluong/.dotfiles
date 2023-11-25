require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    style = 'darker',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

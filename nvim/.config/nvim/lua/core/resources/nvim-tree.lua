return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()

      require("nvim-tree").setup({
        renderer = {
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
        }
      })

      vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

      -- local function open_nvim_tree(data)
      --   -- only files
      --   if vim.fn.filereadable(data.file) == 1 then
      --     return
      --   end
      --
      --   -- open the tree
      --   require("nvim-tree.api").tree.open()
      -- end
      --
      -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },
}

return {
  {
    'famiu/bufdelete.nvim'
  },
  {
    'akinsho/bufferline.nvim',
    -- version = "*",
    branch = "main",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>o", ":BufferLineCloseOthers<CR>",  desc = "Close other buffers" },
      { "gb", ":BufferLinePick<CR>", "Pick a buffer in view" },
      { "gD", ":Bdelete<CR>" }
    },
    config = function()
      local bufferline = require("bufferline")
      vim.api.nvim_set_keymap("n", "<leader>1", [[<Cmd>lua require("bufferline").go_to(1, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>2", [[<Cmd>lua require("bufferline").go_to(2, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>3", [[<Cmd>lua require("bufferline").go_to(3, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>4", [[<Cmd>lua require("bufferline").go_to(4, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>5", [[<Cmd>lua require("bufferline").go_to(5, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>6", [[<Cmd>lua require("bufferline").go_to(6, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>7", [[<Cmd>lua require("bufferline").go_to(7, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>8", [[<Cmd>lua require("bufferline").go_to(8, true)<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>9", [[<Cmd>lua require("bufferline").go_to(9, true)<CR>]], { noremap = true, silent = true })
      bufferline.setup {
        options = {
          style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold
          },
          show_close_icon = false,
          mappings = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
              return "9+"
            end
            return tostring(count)
          end,
          separator_style = "thin",
          offsets = {
            {
              filetype = "NvimTree",
              text = "EXPLORER",
              text_align = "center",
            },
          },
          numbers = function(opts)
            return string.format("%s", opts.raise(opts.ordinal))
          end,
          hover = {
            enabled = true,
            delay = 0,
            reveal = { "close" },
          },
          always_show_bufferline = true,
        }
      }
    end,
  },
}

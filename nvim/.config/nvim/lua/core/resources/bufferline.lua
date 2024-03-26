return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>1", ":BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
      { "<leader>2", ":BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
      { "<leader>3", ":BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
      { "<leader>4", ":BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
      { "<leader>5", ":BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
      { "<leader>6", ":BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
      { "<leader>7", ":BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
      { "<leader>8", ":BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
      { "<leader>9", ":BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
      { "<leader>n", ":BufferLineMoveNext<CR>",    desc = "Move buffer to right" },
      { "<leader>p", ":BufferLineMovePrev<CR>",    desc = "Move buffer to left" },
      { "<leader>o", ":BufferLineCloseOthers<CR>",  desc = "Close other buffers" }
    },
    config = function()
      local bufferline = require("bufferline")
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
          numbers = function(opts)
            return string.format('%s', opts.raise(opts.ordinal))
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "EXPLORER",
              text_align = "center",
            },
          },
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

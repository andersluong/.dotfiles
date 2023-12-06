return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function(_, _)
      require('lualine').setup {
        options = {
          icons_enabled = true,
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
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "gb1",   ":BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
      { "gb2",   ":BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
      { "gb3",   ":BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
      { "gb4",   ":BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
      { "gb5",   ":BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
      { "gb6",   ":BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
      { "gb7",   ":BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
      { "gb8",   ":BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
      { "gb9",   ":BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
      { "<S-l>", ":BufferLineCycleNext<CR>",    desc = "Next buffer" },
      { "<S-h>", ":BufferLineCyclePrev<CR>",    desc = "Previous buffer" },
      { "gbo",   ":BufferLineCloseOthers<CR>",  desc = "Close other buffers" }
    },
    config = function()
      -- vim.opt.termguicolors = true
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
              return "9+"
            end
            return tostring(count)
          end,
          separator_style = "slant",
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
        }
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      start_in_insert = true,
    },
    config = function()
      require("toggleterm").setup {}
      vim.keymap.set('n', 'gt', ':ToggleTerm<CR>')
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'gt', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
        -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      vim.cmd("autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif")
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --   },
  --   config = function()
  --     require("ibl").setup({
  --       debounce = 100,
  --       indent = {
  --         char = "▏",
  --         tab_char = "▏",
  --       },
  --       scope = {
  --         injected_languages = true,
  --         show_start = true,
  --         show_end = false,
  --         char = "▏",
  --         -- include = {
  --         --   node_type = { ["*"] = { "*" } },
  --         -- },
  --         -- exclude = {
  --         --   node_type = { ["*"] = { "source_file", "program" }, python = { "module" }, lua = { "chunk" } },
  --         -- },
  --       },
  --     })
  --   end
  -- },
}

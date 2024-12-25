return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim',
  },

  version = '*',
  opts = {
    keymap = {
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true
        }
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        window = {
          border = 'rounded',
        },

      },

      list = {
        selection = 'manual',
      },

      menu = {
        border = 'rounded',

        cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
                local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
        end,

        draw = {
            columns = {
                { "kind_icon", "label", gap = 1 },
                { "kind" },
            },
            components = {
                kind_icon = {
                    text = function(item)
                        local kind = require("lspkind").symbol_map[item.kind] or ""
                        return kind .. " "
                    end,
                    highlight = "CmpItemKind",
                },
                label = {
                    text = function(item)
                        return item.label
                    end,
                    highlight = "CmpItemAbbr",
                },
                kind = {
                    text = function(item)
                        return item.kind
                    end,
                    highlight = "CmpItemKind",
                },
            },
        },
      },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- Disable sources for command-line mode
        cmdline = {},
    },
  },
  opts_extend = { "sources.default" }
}

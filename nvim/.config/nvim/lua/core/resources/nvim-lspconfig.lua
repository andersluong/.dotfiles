return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        lua_ls = {},
        clangd = {},
        ts_ls = {},
        pyright = {},
      }
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "ts_ls",
          "pyright",
        },
      })
      local on_attach = function(client)
        -- mappings
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<space>fm', function()
          vim.lsp.buf.format { async = true }
        end, {})
        vim.keymap.set('n', 'ge', function()
          vim.diagnostic.open_float()
        end, { desc = 'Open error log in a floating dialog' })
        client.server_capabilities.semanticTokensProvider = nil
      end
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end,
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = {
  --         "clangd",
  --         "ts_ls",
  --         "pyright",
  --       },
  --     })
  --     local on_attach = function(client)
  --       -- mappings
  --       vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  --       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  --       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  --       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  --       vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  --       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  --       vim.keymap.set('n', '<space>fm', function()
  --         vim.lsp.buf.format { async = true }
  --       end, {})
  --       vim.keymap.set('n', 'ge', function()
  --         vim.diagnostic.open_float()
  --       end, { desc = 'Open error log in a floating dialog' })
  --       client.server_capabilities.semanticTokensProvider = nil
  --     end
  --     -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
  --     local capabilities = require("blink.cmp").get
  --     local lspconfig = require("lspconfig")
  --
  --     -- setting up language servers
  --     -- lua
  --     lspconfig.lua_ls.setup {
  --       on_attach = on_attach,
  --       capabilities = capabilities,
  --       settings = {
  --         Lua = {
  --           diagnostics = {
  --             globals = { "vim" },
  --           },
  --         },
  --       },
  --     }
  --     -- c++
  --     lspconfig.clangd.setup {
  --       on_attach = on_attach,
  --       capabilities = capabilities,
  --       cmd = {
  --         "clangd",
  --         "--offset-encoding=utf-16",
  --       },
  --     }
  --     -- typescript
  --     lspconfig.ts_ls.setup {
  --       on_attach = on_attach,
  --       capabilities = capabilities,
  --       init_options = {
  --         preferences = {
  --           disableSuggestions = true,
  --         },
  --       },
  --     }
  --     -- python
  --     lspconfig.pyright.setup {
  --       on_attach = on_attach,
  --       capabilities = capabilities,
  --     }
  --   end,
  },
}

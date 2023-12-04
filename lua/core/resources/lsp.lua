return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "tsserver",
        },
      })
      local on_attach = function(_, _)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<space>fm', function()
          vim.lsp.buf.format { async = true }
        end, {})
      end
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      }

      lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      }
    end,
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local au_group = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")

      -- register any number of sources simultaneously
      local sources = {
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
      }

      null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
          -- format on save
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = au_group,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = au_group,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end
            })
          end
        end
      })
    end,
  },
}
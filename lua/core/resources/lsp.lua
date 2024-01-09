local ensure_installed = {
  "clangd",
  "tsserver",
}

local language_setup = function(lspconfig, on_attach, capabilities)
  -- lua
  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }
  -- c++
  lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  }
  -- typescript
  lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  }
end

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
        ensure_installed = ensure_installed,
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
        client.server_capabilities.semanticTokensProvider = nil
      end
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- setting up language servers
      language_setup(lspconfig, on_attach, capabilities)
    end,
  },
  -- formatters
  {
    "nvimtools/none-ls.nvim",
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
        -- on_attach = function(client, bufnr)
        --   -- format on save
        --   if client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_clear_autocmds({
        --       group = au_group,
        --       buffer = bufnr,
        --     })
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --       group = au_group,
        --       buffer = bufnr,
        --       callback = function()
        --         vim.lsp.buf.format({ bufnr = bufnr })
        --       end
        --     })
        --   end
        -- end
      })
    end,
  },
}

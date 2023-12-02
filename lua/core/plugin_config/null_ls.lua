local au_group = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.clang_format,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {'projekt0n/github-nvim-theme', name = 'github-theme', priority = 1000},
  "jose-elias-alvarez/null-ls.nvim",
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nanozuki/tabby.nvim',
  'ohrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {{'nvim-lua/plenary.nvim'}}
  },
  'm4xshen/autoclose.nvim',
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
  },
}

require("lazy").setup(plugins, opts)

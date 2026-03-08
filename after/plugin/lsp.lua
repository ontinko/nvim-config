local lsp = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

lsp.preset("recommended")

-- Setup mason first
mason.setup()

-- Setup mason-lspconfig with ensure_installed
mason_lspconfig.setup({
  ensure_installed = {
    'solargraph',   -- Ruby
    'html',
    'pylsp',        -- Python 3.6+
    'yamlls',
    'ts_ls',        -- JS & TS
    'cssls',        -- CSS
    'gopls',        -- Go
    -- 'eslint',
    'lua_ls',
    'clangd',
    'phpactor',
    'intelephense', -- PHP
    'vuels',        -- Vue.js
    'prismals',
    'sqls',
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp.default_keymaps({ buffer = bufnr })
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

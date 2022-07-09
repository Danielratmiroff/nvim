local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return "Something failed loading Lspconfig"
end

require "lsp.signature"
require "lsp.installer"
require("lsp.handlers").setup()
require "lsp.null-ls"
require "lsp.lsp-kind"

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- Lsp diagnostic configuration
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
    },
  })

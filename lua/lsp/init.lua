local lspconfig = require "lspconfig"

require "lsp.signature"
require "lsp.installer"
require "_cmp"
require("lsp.handlers").setup()
require "lsp.null-ls"

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

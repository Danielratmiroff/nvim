local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "lsp.signature"
require "lsp.installer"
require("lsp.handlers").setup()
require "lsp.null-ls"

vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

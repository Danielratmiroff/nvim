local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

vim.cmd([[verbose set omnifunc]])

require "lsp.signature"
require "lsp.installer"
require("lsp.handlers").setup()
require "lsp.null-ls"



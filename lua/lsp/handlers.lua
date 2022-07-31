local M = {}

local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"


-- Settings for LSP
M.setup = function()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
    -- height = 30,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
    -- height = 30,
  })
end

return M

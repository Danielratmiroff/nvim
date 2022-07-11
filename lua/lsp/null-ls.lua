--local null_ls_status_ok, null_ls = pcall(require, "null-ls")
--if not null_ls_status_ok then
-- return "Something failed loading null-ls"
--end

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vvim.lsp.buf.format({ bufnr = bufnr }) im.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,

  debouce = 150,

  sources = {
    formatting.prettier,
    formatting.fixjson,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,

    diagnostics.tsc,
    diagnostics.eslint,
    diagnostics.flake8
  },
})

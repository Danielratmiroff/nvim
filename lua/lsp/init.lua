require("lsp.signature")
require("lsp.installer")
require("_cmp")
require("lsp.handlers")
require("lsp.null-ls")

local lsp = require("lsp-zero")

-- Lsp-Zero configuration to LSP
lsp.set_preferences({
  suggest_lsp_servers = true,
  -- TODO: most likely needed to disable (since we are configuring it ourselves)
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = false,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = "local",
  sign_icons = {
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "",
  },
})

lsp.on_attach(function(client, bufnr)
  local noremap = { buffer = bufnr, remap = false }
  local keymap = vim.keymap.set

  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremap)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", noremap)
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremap)
  keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", noremap)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", noremap)

  keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noremap)

  keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap)
  keymap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", noremap)
  keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", noremap)
  keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', noremap)
  keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', noremap)
  -- keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", noremap)

  require("illuminate").on_attach(client)
end)


vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Lsp diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lsp.setup()

require "lsp.signature"
require "lsp.installer"
require "_cmp"
require("lsp.handlers").setup()
require "lsp.null-ls"

local lsp = require('lsp-zero')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = false,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

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

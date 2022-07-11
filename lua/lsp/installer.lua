local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return "Something failed loading lsp-installer"
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  -- JAVA  "jdtls",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "dockerls",
  "dotls",
  "eslint",
  "gopls",
  "golangci_lint_ls",
  "graphql",
  "marksman",
  "stylelint_lsp",
  "vuels",
  "vimls",
}

local settings = {
  ensure_installed = servers,
  automatic_installatin = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },

  log_level = vim.log.levels.INFO,
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lsp-config")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("handlers").on_attach,
    capabilities = require("handlers").capabilities,
  }

  if server == "jsonls" then
    local jsonls_opts = require "jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require "sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

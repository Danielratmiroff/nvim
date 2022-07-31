-- Settings for Lsp Language Server Installer
local lsp_installer = require "nvim-lsp-installer"

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
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
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


  -- if server == "jsonls" then
  --   local jsonls_opts = require "lsp.settings.jsonls"
  --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end
  --
  -- if server == "yamlls" then
  --   local yamlls_opts = require "lsp.settings.yamlls"
  --   opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  -- end
  --
  -- if server == "sumneko_lua" then
  --   local sumneko_opts = require "lsp.settings.sumneko_lua"
  --   opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  -- end
  --
  -- if server == "pyright" then
  --   local pyright_opts = require "lsp.settings.pyright"
  --   opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  -- end
  --
  -- if server == "gopls" then
  --   local gopls_opts = require "lsp.settings.gopls"
  --   opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  -- end
  --
  -- if server == "tsserver" then
  --   local tsserver_opts = require "lsp.settings.tsserver"
  --   opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  -- end
  --
  -- if server == "emmet_ls" then
  --   local emmet_ls_opts = require "lsp.settings.emmet_ls"
  --   opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  -- end
  --
  -- lspconfig[server].setup(opts)
  -- ::continue::

-- Settings for Lsp Language Server Installer

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "sumneko_lua",
  "golangci-lint",
  "quick-lint-js",
  "yamllint",
  "tsserver",
  "selene",
  "vint",
  "pyright",
  "yamlls",
  "bashls",
  "dockerls",
  "dotls",
  "eslint",
  "gopls",
  "golangci_lint_ls",
  "marksman",
  "vuels",
  "vimls",
  "prettierd",
  "fixjson"
}

local settings = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },

    keymaps = {
      toggle_package_expand = "<CR>", -- Keymap to expand a package
      install_package = "i", -- Keymap to install the package under the current cursor position
      update_package = "u", -- Keymap to reinstall/update the package under the current cursor position
      check_package_version = "c", -- Keymap to check for new version for the package under the current cursor position
      update_all_packages = "U", -- Keymap to update all installed packages
      check_outdated_packages = "C", -- Keymap to check which installed packages are outdated
      uninstall_package = "X", -- Keymap to uninstall a package
      cancel_installation = "<C-c>", -- Keymap to cancel a package installation
      apply_language_filter = "<C-f>", -- Keymap to apply language filter
    },
  },

  max_concurrent_installers = 4,
  log_level = vim.log.levels.INFO,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

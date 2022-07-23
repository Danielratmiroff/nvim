local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.close,
        ["<C-x>"] = actions.file_vsplit,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.close,
        ["<C-x>"] = actions.file_vsplit,
      },
    },
    file_ignore_patterns = {
      "node_modules/.*",
      "secret.d/.*",
      "%.pem",
      ".git/",

    },
    path_display = { "smart" },
  }
})

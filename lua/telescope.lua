local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return "Something failed with Telescope"
end

-- local actions = require "telescope.actions" Need to define new keymaps for navigation

telescope.setup({
  defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
        "secret.d/.*",
        "%.pem",
        ".git/",

      },
       path_display = { "smart" },
    }
  })


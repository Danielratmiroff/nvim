local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "css",
    "markdown_inline",
    "regex",
    "python",
    "scss",
    "slint",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml",
    "vim",
    "json",
    "html",
    "javascript",
    "comment",
    "dockerfile",
    "lua",
    "go",
    "http",
    "gowork",
    "gomod",
  }, -- one of "all" or a list of languages
  auto_install = true, -- Automatically install missing parsers when entering buffer
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  autotag = {
    enable = true,
  },
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    -- use_languagetree = true,
    enable = true, -- false will disable the whole extension
    -- disable = { "css", "html" }, -- list of language that will be disabled
    -- disable = { "css", "markdown" }, -- list of language that will be disabled
    disable = { }, -- list of language that will be disabled
    -- additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = {} },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}


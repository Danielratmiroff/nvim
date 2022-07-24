-- Neovim Plugins

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost _plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Themes
  -- use "sainnhe/edge"
  use 'folke/tokyonight.nvim'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- use({ "vim-airline/vim-airline "}) " Replaced by lualine
  -- use({ "vim-airline/vim-airline-themes "})
  --
  --  use "simrat39/symbols-outline.nvim"
  --  use "b0o/SchemaStore.nvim"
  -- use "folke/trouble.nvim"
  use "windwp/nvim-autopairs"
  use "RRethy/vim-illuminate" -- Illuminate next matching definition
  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim', -- Setup LSP for us (thankfully)
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/nvim-lsp-installer' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-cmdline' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Tabnine
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  -- cmp plugins
  use 'onsails/lspkind-nvim'
  use "ray-x/lsp_signature.nvim"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "nvim-lua/lsp_extensions.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"

  -- Formatters and linters
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html' }
  }

  -- Extra juicy stuff
  use "numToStr/Comment.nvim" -- Commenter toogler
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Commenter
  use "fatih/vim-go" -- Go development plugin 
  use "mhinz/vim-startify" -- Welcome screen to vim
  use "mg979/vim-visual-multi" -- multi cursor
  use "tpope/vim-surround" -- surround word 
  use { "pearofducks/ansible-vim", run = './UltiSnips/generate.sh' } -- Detect ansible filetypes

  -- Git
  -- use "tpope/vim-fugitive"
  -- use "lewis6991/gitsigns.nvim"
  --  use "ruifm/gitlinker.nvim"
  -- use "mattn/vim-gist"
  --use "mattn/webapi-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

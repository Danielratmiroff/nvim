-- Color scheme

vim.cmd([[ 
if has('termguicolors')
set termguicolors
endif
]])

-- Theme settings
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent = true

-- Load colorscheme
vim.cmd [[colorscheme tokyonight-night]]

-- Edge colorscheme
--let g:edge_style = 'aura'
--let g:edge_better_performance = 1
--colorscheme edge

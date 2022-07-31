-- Nvim Options

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  -- termguicolors = true,                 -- (Should be unnecesary) set term gui colors (most terminals support this)
  timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = false, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 12, -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  incsearch = true, -- incremental search
  showmatch = true, -- show matching
  softtabstop = 4, -- see multiple spaces as tabstops so <BS> does the right thing
  expandtab = true, -- converts tabs to white space
  autoindent = true, -- indent a new line the same amount as the line just typed
  ttyfast = true, -- Speed up scrolling in Vim
  wildmode = "longest,list", -- get bash-like tab completions
  syntax = "on", -- syntax highlighting
  laststatus = 2,
  autoread = true

}

vim.cmd([[let g:python3_host_prog = '/bin/python3']])
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype plugin indent on]]) -- allow auto-indenting depending on file type

-- Allow remapping enter
vim.cmd([[autocmd CmdwinEnter * nnoremap <CR> <CR>]])
vim.cmd([[autocmd BufReadPost quickfix nnoremap <CR> <CR>]])

vim.cmd([[let g:prettier#autoformat = 1]])
vim.cmd([[let g:prettier#autoformat_require_pragma = 0]])

vim.g.ansible_extra_keywords_highlight = 1 -- highlight ansible keywords
vim.g.use_nerd_icons = true

vim.opt.shortmess:append "c"
vim.cmd([["set whichwrap+=<,>,[,],h,l"]])
vim.cmd([[set iskeyword+=-]])

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- WSL yank support for clipboard
vim.cmd([[
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]])

-- Highlight yanked text
vim.cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}
]])

--Trigger autoread (reload) to keep vim on sync with file changes
vim.cmd([[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif " Triger `autoread` when files changes on disk
autocmd FileChangedShellPost * echo "File changed on disk. Buffer reloaded." " Notification after file change
" autocmd FocusGained * :e " Refresh buffer on focus -- TODO: disabled cause err warnings keep spamming
]])

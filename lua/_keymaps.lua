-- Key Mappings
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- General
keymap("n", "<C-u>", '<C-r>', opts) -- redo
keymap("i", "jk", '<ESC>', opts) -- exit insert mode
keymap("n", "<Enter>", 'o<ESC>', opts) -- standard enter
keymap("n", "<BS>", 'a<BS><ESC>', opts) -- standard backspace
keymap("n", "n", 'nzzzv', opts) -- keep screen centred when searching
keymap("n", "N", 'Nzzzv', opts) -- keep screen centred when searching
keymap("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts) -- replace all matches
-- keymap("v", "y", 'ygv', opts) -- keep cursor in place after yanking

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("v", "<C-a>", "gg<S-v>G", opts)

-- Delete without yank
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "<Del>", '"_x', opts)
keymap("n", "db", 'vb"_d', opts)
keymap("n", "<Leader>d", '"_d', opts)
keymap("n", "<Leader>d", '"_d', opts)

keymap("n", "<Leader>p", '"0p', opts)
keymap("n", "<Leader>P", '"0P', opts)

-- File management
-- Save file
keymap("n", "<C-s>", ':update<cr>', opts)
keymap("i", "<C-s>", '<Esc>:update<cr>gi', opts)
keymap("v", "<C-s>", ':<Esc>:update<cr>gv', opts)
-- Quit file
keymap("n", "<C-q>", ':q<cr>', opts)
keymap("v", "<C-q>", '<Esc>:q<cr>', opts)
keymap("i", "<C-q>", '<Esc>:q<cr>', opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Splits
-- keymap("n", "<C-p>", ":wincmd h <bar> :Vex<cr>", opts) -- open file tree
keymap("n", "<C-\\>", "<C-w>v", opts) -- split screen

-- Navigate buffers
keymap("n", "<C-o>", "<C-^>", opts) -- back/forth buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) - Move and enter edit mode
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

--- Visual Block ---
-- Move text up and down
keymap("n", "<Leader>q", "<C-q>", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--
-- Telescope
--
-- Builtin
keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', opts)
keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', opts)
keymap('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap('n', '<leader>fd', '<CMD>lua require("telescope.builtin").live_grep({grep_open_file = true})<CR>', opts)
keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap('n', '<leader>fe', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', opts)
keymap('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', opts)
keymap("n", "<C-p>", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts) -- Telescope's file_browser plugin

-- Luasnipts
keymap("i", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("n", "<leader>so", "<cmd>source ~/.config/nvim/lua/_luasnip.lua<CR>", opts)

-- Toogle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
    vim.diagnostic.show()
  else
    vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
    vim.diagnostic.hide()
  end
end

vim.keymap.set('n', '<leader>e', toggle_diagnostics)

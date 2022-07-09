-- Key Mappings

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ' '

keymap("n", "<Leader>a", "gg", opts)
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--- Normal ---
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) - Move and enter edit mode
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--- Visual ---
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

--- Visual Block ---
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
-- Builtin
keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', opts)
keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', opts)
keymap('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap('n', '<leader>fd', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', opts)
keymap('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', opts)

-- Language Servers 
-- -- Do not work for now
-- keymap('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', opts)
-- keymap('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', opts)
-- keymap('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', opts)
-- keymap('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>',opts)

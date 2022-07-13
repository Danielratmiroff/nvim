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

-- Delete without yank
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "db", '"_db', opts)

keymap("n", "<Leader>d", 'd', opts)
keymap("n", "<Leader>D", 'D', opts)
keymap("n", "<Leader>db", 'db', opts)

keymap("v", "d", '"_d', opts)
keymap("v", "<Leader>d", '"_d', opts)
-- Change without yank
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("n", "cb", '"_cb', opts)

-- Exit insert mode
keymap("i", "jk", '<ESC>', opts)

-- File management
keymap("n", "<Leader>b", ':e .<cr>', opts) -- Open dir tree
-- Save file
keymap("n", "<C-s>", ':update<cr>', opts)
keymap("i", "<C-s>", '<Esc>:update<cr>gi', opts)
keymap("v", "<C-s>", ':<Esc>:update<cr>gv', opts)
-- Quit file
keymap("n", "q", ':q<cr>', opts)
keymap("v", "q", '<Esc>:q<cr>', opts)
keymap("i", "q", '<Esc>:q<cr>', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("v", "<C-a>", "gg<S-v>G", opts)

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
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

--- Visual Block ---
-- Move text up and down
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
keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap('n', '<leader>fe', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', opts)
keymap('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', opts)

-- Language Servers
-- -- Do not work for now
-- keymap('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', opts)
-- keymap('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', opts)
-- keymap('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', opts)
-- keymap('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>',opts)
--
--
--

-- Toogle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

vim.keymap.set('n', '<leader>e', toggle_diagnostics)

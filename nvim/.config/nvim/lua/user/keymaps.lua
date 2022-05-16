local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Replace ^ and $ with H and L
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Replace macro-recording q with Q
keymap("n", "Q", "q", opts)
keymap("n", "q", "<Nop>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fc", ":NvimTreeFindFile<cr>", opts)

-- Bufferline
keymap("n", "<C-q>", ":Bdelete!<cr>", opts)

-- Switch words
keymap("n", "gs", ":Switch<cr>", opts)

-- ToggleTerm
-- 退出终端插入模式
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
-- 打开普通终端
-- keymap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", opts)
-- 打开浮动终端
-- keymap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", opts)
-- 打开lazy git 终端
keymap("n", "<leader>tg", ":ToggleTerm _LAZYGIT_TOGGLE<CR>", opts)
-- python
keymap("n", "<leader>tp", ":ToggleTerm _PYTHON_TOGGLE<CR>", opts)
-- TODO 创建键位使得自动运行程序
keymap("n", "<leader>tc", ":TermExec cmd='g++ -std=c++17 % -o build'<CR>", opts)
-- 打开或关闭所有终端
keymap("n", "<leader>ta", ":ToggleTermToggleAll<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
keymap('n', '<leader>fg', ":lua require'telescope.builtin'.live_grep({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
keymap('n', '<leader>fo', ":lua require'telescope.builtin'.oldfiles()<cr>", opts)

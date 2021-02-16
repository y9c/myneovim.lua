local k = require "astronauta.keymap"

local noremap = k.noremap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap

-- split windows
nnoremap {"vv", "<C-w>v"}
nnoremap {"ss", "<C-w>s"}

-- moving windows
nnoremap {"<C-j>", "<C-w>j"}
nnoremap {"<C-k>", "<C-w>k"}
nnoremap {"<C-h>", "<C-w>h"}
nnoremap {"<C-l>", "<C-w>l"}

-- save file
noremap {"<F2>", ":w<CR>"}
inoremap {"<F2>", "<ESC>:w<CR>"}

-- kill current buffer
noremap {"<C-x>", ":bd<CR>"}

-- Better completion nav
-- vim.api.nvim_set_keymap('i', '<C-j>', [[\<C-n>]], {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<C-k>', [[\<C-p>]], {expr = true, noremap = true})

-- moving tabs
nnoremap {"]b", ":BufferLineCycleNext<CR>"}
nnoremap {"[b", ":BufferLineCyclePrev<CR>"}

-- toggle nvimtree
nnoremap {"<leader>e", "<CMD>NvimTreeToggle<CR>"}

-- undo and redo
noremap {"u", ":undo<CR>"}
noremap {"U", ":redo<CR>"}

-- visual indent
vnoremap {">", ">gv"}
vnoremap {"<", "<gv"}

-- toggle commentary
nnoremap {"<leader>bc", "gcc"}

-- LSP
vim.api.nvim_buf_set_keymap(0, "n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>Lspsaga hover_doc<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "ga", "<cmd>Lspsaga code_action<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>Lspsaga preview_definition<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "gs", "<cmd>Lspsaga signature_help<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>Lspsaga rename<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "<Leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true})

vim.api.nvim_buf_set_keymap(0, "v", "ga", "<cmd><C-U>Lspsaga range_code_action", {noremap = true})

-- Formatter
vim.api.nvim_buf_set_keymap(0, "n", "<Localleader>f", "<cmd>lua vim.api.nvim_command('Format')<CR>", {noremap = true})

-- Terminal
vim.api.nvim_buf_set_keymap(0, "n", "<A-d>", "<cmd>Lspsaga open_floaterm", {noremap = true})
vim.api.nvim_buf_set_keymap(0, "n", "<A-d>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", {noremap = true})

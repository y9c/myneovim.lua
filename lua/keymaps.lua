-- local remap = vim.api.nvim_set_keymap
-- local options = {noremap = true}

local k = require "astronauta.keymap"

local nmap = k.nmap
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
nnoremap {"]b", "<cmd>BufferLineCycleNext<CR>"}
nnoremap {"[b", "<cmd>BufferLineCyclePrev<CR>"}

-- toggle nvimtree explorer
nnoremap {"<leader>e", "<cmd>NvimTreeToggle<CR>"}
nnoremap {"<F3>", "<cmd>NvimTreeToggle<cr>"}

-- undo and redo
noremap {"u", ":undo<CR>"}
noremap {"U", ":redo<CR>"}

-- visual indent
vnoremap {">", ">gv"}
vnoremap {"<", "<gv"}

-- toggle commentary (gcc is a map key, so noremap won't work!)
nmap {"<leader>bc", "gcc"}

-- Version control
-- mappings
nnoremap {"<Leader>gd", "<cmd>SignifyDiff<cr>"}
nnoremap {"<Leader>gh", "<cmd>SignifyHunkDiff<cr>"}
nnoremap {"<Leader>gu", "<cmd>SignifyHunkUndo<cr>"}
nnoremap {"<Leader>gt", "<cmd>SignifyToggle<cr>"}
-- hunk jumping
nmap {"]g", "<plug>(signify-next-hunk)"}
nmap {"[g", "<plug>(signify-prev-hunk)"}

-- Packer
nnoremap {"<leader>pc", "<cmd>PackerCompile<CR>"}
nnoremap {"<leader>pi", "<cmd>PackerInstall<CR>"}
nnoremap {"<leader>pu", "<cmd>PackerUpdate<CR>"}

-- LSP
nnoremap {"<leader>li", "<cmd>LspInfo<CR>"}
nnoremap {"<leader>lu", "<cmd>LspUpdate<CR>"}
nnoremap {"[e", "<cmd>Lspsaga diagnostic_jump_next<CR>"}
nnoremap {"]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>"}
nnoremap {"K", "<cmd>Lspsaga hover_doc<CR>"}
nnoremap {"ga", "<cmd>Lspsaga code_action<CR>"}
nnoremap {"gd", "<cmd>Lspsaga preview_definition<CR>"}
nnoremap {"gs", "<cmd>Lspsaga signature_help<CR>"}
nnoremap {"gr", "<cmd>Lspsaga rename<CR>"}
nnoremap {"gh", "<cmd>Lspsaga lsp_finder<CR>"}
nnoremap {"<Leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>"}

vim.api.nvim_buf_set_keymap(0, "v", "ga", "<cmd><C-U>Lspsaga range_code_action", {noremap = true})

-- Formatter
vim.api.nvim_buf_set_keymap(0, "n", "<Localleader>f", "<cmd>lua vim.api.nvim_command('Format')<CR>", {noremap = true})

-- Complete
inoremap {"<silent><expr> <C-Space>", "compe#complete()"}
inoremap {"<silent><expr> <CR>", "compe#confirm('<CR>')"}
inoremap {"<silent><expr> <C-e>", "compe#close('<C-e>')"}
inoremap {"<silent><expr> <C-f>", "compe#scroll({ 'delta': +4 })"}
inoremap {"<silent><expr> <C-d>", "compe#scroll({ 'delta': -4 })"}
-- --
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Terminal
vim.api.nvim_buf_set_keymap(0, "n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", {noremap = true})
-- vim.api.nvim_buf_set_keymap(0, "t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {noremap = true})
vim.fn.nvim_set_keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {})

-- telescope finder
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  '<cmd>lua require("telescope.builtin").find_files()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  '<cmd>lua require("telescope.builtin").buffers()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fw",
  '<cmd>lua require("telescope.builtin").windows()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f:",
  '<cmd>lua require("telescope.builtin").command_history()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgs",
  '<cmd>lua require("telescope.builtin").git_status()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgr",
  '<cmd>lua require("my-telescope").git_recents()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgb",
  '<cmd>lua require("telescope.builtin").git_branches()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgc",
  '<cmd>lua require("telescope.builtin").git_commits()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>flr",
  '<cmd>lua require("telescope.builtin").lsp_references()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fld",
  '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>flw",
  '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fla",
  '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "v",
  "<Leader>fla",
  '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>',
  {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>c",
  '<cmd>lua require("telescope.builtin").git_files({cwd = "~/.config"})<cr>',
  {noremap = true, silent = true}
)

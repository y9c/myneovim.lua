-- local remap = vim.api.nvim_set_keymap
-- local options = {noremap = true}

local k = require "astronauta.keymap"

local nmap = k.nmap
local vmap = k.vmap
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
inoremap {"<F2>", "<ESC>:w<CR>a"}

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
nnoremap {"<F3>", "<cmd>NvimTreeToggle<CR>"}

-- toggle vista viewer
nnoremap {"<F4>", "<cmd>Vista!!<CR>"}

-- undo and redo
noremap {"u", ":undo<CR>"}
noremap {"U", ":redo<CR>"}

-- visual indent
vnoremap {">", ">gv"}
vnoremap {"<", "<gv"}

-- toggle commentary (gcc is a map key, so noremap won't work!)
nmap {"<leader>bc", "gcc"}
vmap {"<leader>bc", "gc"}

-- Version control
-- mappings
nnoremap {"<F7>", "<cmd>SignifyDiff<CR>"}
nnoremap {"<Leader>gh", "<cmd>SignifyHunkDiff<CR>"}
nnoremap {"<Leader>gu", "<cmd>SignifyHunkUndo<CR>"}
nnoremap {"<Leader>gt", "<cmd>SignifyToggle<CR>"}
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
nnoremap {"gd", "<cmd>Lspsaga preview_definition<CR>"}
nnoremap {"gr", "<cmd>Lspsaga lsp_finder<CR>"} -- press `q` to close float term
nnoremap {"<leader>rn", "<cmd>Lspsaga rename<CR>"}
nnoremap {"ga", "<cmd>Lspsaga code_action<CR>"}
nnoremap {"gs", "<cmd>Lspsaga signature_help<CR>"}
nnoremap {"<leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>"}

vim.api.nvim_buf_set_keymap(0, "v", "ga", "<cmd><C-U>Lspsaga range_code_action", {noremap = true})

-- Formatter
vim.api.nvim_buf_set_keymap(0, "n", "<Localleader>f", "<cmd>lua vim.api.nvim_command('Format')<CR>", {noremap = true})

-- Complete
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true, silent = true})
-- --
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Plugin MarkdownPreview
nmap {"<leader>om", "<plug>MarkdownPreviewToggle"}

-- Translator
-- Echo translation in the cmdline
nmap {"<Leader>te", "<Plug>Translate"}
vmap {"<Leader>te", "<Plug>TranslateV"}
-- Display translation in a window
nmap {"T", "<Plug>TranslateW"}
vmap {"T", "<Plug>TranslateWV"}
-- Replace the text with translation
nmap {"<Leader>tr", "<Plug>TranslateR"}
vmap {"<Leader>tr", "<Plug>TranslateRV"}
-- Translate the text in clipboard
nmap {"<Leader>ty", "<Plug>TranslateX"}

-- Terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<A-d>",
  "<cmd>lua require('lspsaga.floaterm').open_float_terminal('',1)<CR>",
  {noremap = true}
)
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
  '<cmd>lua require("telescope.builtin").git_files({cwd = "~/.config"})<CR>',
  {noremap = true, silent = true}
)

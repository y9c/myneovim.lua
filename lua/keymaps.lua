-- local remap = vim.api.nvim_set_keymap
-- local options = {noremap = true}

local k = require "astronauta.keymap"

local nmap = k.nmap
local vmap = k.vmap
local omap = k.omap
local xmap = k.xmap

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
nnoremap {"<leader>ps", "<cmd>PackerSync<CR>"}

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

-- Quick Jump
_G.enhance_ft_move = function(key)
  if not packer_plugins["vim-eft"].loaded then
    vim.cmd [[packadd vim-eft]]
  end
  local map = {
    f = "<Plug>(eft-f)",
    F = "<Plug>(eft-F)",
    [","] = "<Plug>(eft-repeat)"
  }
  return vim.api.nvim_replace_termcodes(map[key], true, true, true)
end

vim.api.nvim_set_keymap("n", "f", "v:lua.enhance_ft_move('f')", {expr = true})
vim.api.nvim_set_keymap("x", "f", "v:lua.enhance_ft_move('f')", {expr = true})
vim.api.nvim_set_keymap("o", "f", "v:lua.enhance_ft_move('f')", {expr = true})
vim.api.nvim_set_keymap("n", "F", "v:lua.enhance_ft_move('F')", {expr = true})
vim.api.nvim_set_keymap("x", "F", "v:lua.enhance_ft_move('F')", {expr = true})
vim.api.nvim_set_keymap("o", "F", "v:lua.enhance_ft_move('F')", {expr = true})

-- Quick Run
vim.api.nvim_set_keymap("n", "<localleader>r", "<plug>QuickRun -mode n<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "<localleader>r", "<plug>QuickRun -mode v<cr>", {silent = true, noremap = true})

nnoremap {"<localleader>r", "<cmd>QuickRun -mode n<CR>"}
vnoremap {"<localleader>r", "<cmd>QuickRun -mode v<CR>"}
nnoremap {"<F5>", "<cmd>QuickRun -mode n<CR>"}
vnoremap {"<F5>", "<cmd>QuickRun -mode v<CR>"}

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
  "<A-t>",
  "<cmd>lua require('lspsaga.floaterm').open_float_terminal('')<CR>",
  {noremap = true}
)
-- vim.api.nvim_buf_set_keymap(0, "t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {noremap = true})
vim.fn.nvim_set_keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {})

-- Telescope File Pickers
nnoremap {"<leader>ff", "<cmd>Telescope find_files<CR>"} -- "<cmd>DashboardFindFile<CR>" is a similar one
nnoremap {"<leader>gg", "<cmd>Telescope live_grep<CR>"} -- "<cmd>DashboardFindWord<CR>" is a similar one
nnoremap {"<leader>fw", "<cmd>Telescope grep_string<CR>"}
-- Telescope vim Pickers
nnoremap {"<leader>cc", "<cmd>Telescope commands<CR>"}
nnoremap {"<leader>fb", "<cmd>Telescope buffers<CR>"}
nnoremap {"<leader>fo", "<cmd>Telescope oldfiles<CR>"}
nnoremap {"<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<CR>"}
-- Telescope Git Pickers
nnoremap {"<leader>gf", "<cmd>Telescope git_files<CR>"}
nnoremap {"<leader>gc", "<cmd>Telescope git_commits<CR>"}
nnoremap {"<leader>gs", "<cmd>Telescope git_status<CR>"}
-- Telescope frequency
nnoremap {"<leader>fm", "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>"}

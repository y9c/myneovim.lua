-- split windows
vim.api.nvim_set_keymap("n", "vv", "<C-w>v", {noremap = true})
vim.api.nvim_set_keymap("n", "ss", "<C-w>s", {noremap = true})

-- moving windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})

-- save file
vim.api.nvim_set_keymap("n", "<F2>", ":w<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<F2>", "<ESC>:w<CR>a", {noremap = true})

-- kill current buffer
vim.api.nvim_set_keymap("n", "<C-x>", ":bd<CR>", {noremap = true})

-- Better completion nav
-- vim.api.nvim_set_keymap('i', '<C-j>', [[\<C-n>]], {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<C-k>', [[\<C-p>]], {expr = true, noremap = true})

-- moving tabs
vim.api.nvim_set_keymap("n", "]b", "<cmd>BufferLineCycleNext<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "[b", "<cmd>BufferLineCyclePrev<CR>", {noremap = true})

-- toggle nvimtree explorer
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>NvimTreeToggle<CR>", {noremap = true})

-- toggle vista viewer
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>Vista!!<CR>", {noremap = true})

-- undo and redo
vim.api.nvim_set_keymap("n", "u", ":undo<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "U", ":redo<CR>", {noremap = true})

-- visual indent
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})

-- toggle commentary (gcc is a map key, so noremap won't work!)
vim.api.nvim_set_keymap("n", "<leader>bc", "gcc", {})
vim.api.nvim_set_keymap("v", "<leader>bc", "gc", {})

-- Version control
-- mappings
vim.api.nvim_set_keymap("n", "<F7>", "<cmd>SignifyDiff<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gh", "<cmd>SignifyHunkDiff<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gu", "<cmd>SignifyHunkUndo<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gt", "<cmd>SignifyToggle<CR>", {noremap = true})

-- hunk jumping
vim.api.nvim_set_keymap("n", "[g", "<plug>(signify-prev-hunk)", {})
vim.api.nvim_set_keymap("n", "]g", "<plug>(signify-next-hunk)", {})

-- Packer
vim.api.nvim_set_keymap("n", "<leader>pc", "<cmd>PackerCompile<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>pi", "<cmd>PackerInstall<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>pu", "<cmd>PackerUpdate<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>PackerSync<CR>", {noremap = true})

-- LSP
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>LspInfo<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>LspInstallInfo<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "]e", "n<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "vd", "<cmd>Lspsaga preview_definition<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "vr", "<cmd>Lspsaga lsp_finder<CR>", {noremap = true}) -- press `q` to close float term
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "va", "<cmd>Lspsaga code_action<CR>", {noremap = true})
vim.api.nvim_set_keymap("v", "va", "<cmd><C-U>Lspsaga range_code_action<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "vs", "<cmd>Lspsaga signature_help<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true})

-- Formatter
function run_formatter()
  local filetype = vim.bo.filetype
  local formatters = require("formatter.config").values.filetype[filetype]

  if vim.bo.modifiable then
    if not require("formatter.util").isEmpty(formatters) then
      vim.api.nvim_command("Format")
    else
      vim.lsp.buf.formatting()
    end
  end
end

vim.api.nvim_buf_set_keymap(0, "n", "<Localleader>f", "<cmd>lua run_formatter()<CR>", {noremap = true})

-- Auto header
-- vim.api.nvim_set_keymap("n", "<F7>", "<cmd>AddHeader<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("i", "<F7>", "<cmd>AddHeader<CR>", {noremap = true})

-- Complete
-- vim.api.nvim_set_keymap("i", "<C-Space>", "cmp#complete()", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "cmp#confirm('<CR>')", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-e>", "cmp#close('<C-e>')", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-f>", "cmp#scroll({ 'delta': +4 })", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-d>", "cmp#scroll({ 'delta': -4 })", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Snippets Jump
--
vim.api.nvim_set_keymap(
  "i",
  "<C-n>",
  [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
  {noremap = false, expr = true}
)
vim.api.nvim_set_keymap(
  "s",
  "<C-n>",
  [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
  {noremap = false, expr = true}
)
vim.api.nvim_set_keymap(
  "i",
  "<C-p>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  {noremap = false, expr = true}
)
vim.api.nvim_set_keymap(
  "s",
  "<C-p>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  {noremap = false, expr = true}
)

-- Quick Jump

vim.api.nvim_set_keymap("n", "f", "<cmd>Pounce<CR>", {})
vim.api.nvim_set_keymap("n", "F", "<cmd>PounceRepeat<CR>", {})
vim.api.nvim_set_keymap("v", "f", "<cmd>Pounce<CR>", {})
-- omap gs <cmd>Pounce<CR>

-- Quick Run
vim.api.nvim_set_keymap("n", "<localleader>r", "<cmd>QuickRun -mode n<CR>", {noremap = true})
vim.api.nvim_set_keymap("v", "<localleader>r", "<cmd>QuickRun -mode v<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>QuickRun -mode n<CR>", {noremap = true})
vim.api.nvim_set_keymap("v", "<F5>", "<cmd>QuickRun -mode v<CR>", {noremap = true})

-- Plugin MarkdownPreview
vim.api.nvim_set_keymap("n", "<C-p>", "<plug>MarkdownPreviewToggle", {})
vim.api.nvim_set_keymap("n", "<Leader>mv", "<plug>MarkdownPreviewToggle", {})

-- Translator
-- Echo translation in the cmdline
vim.api.nvim_set_keymap("n", "<Leader>te", "<Plug>Translate", {})
vim.api.nvim_set_keymap("n", "<Leader>te", "<Plug>TranslateV", {})
-- Display translation in a window
vim.api.nvim_set_keymap("n", "T", "<Plug>TranslateW", {})
vim.api.nvim_set_keymap("v", "T", "<Plug>TranslateWV", {})
-- Replace the text with translation
vim.api.nvim_set_keymap("n", "<Leader>tr", "<Plug>TranslateR", {})
vim.api.nvim_set_keymap("v", "<Leader>tr", "<Plug>TranslateRV", {})
-- Translate the text in clipboard
vim.api.nvim_set_keymap("n", "<Leader>ty", "<Plug>TranslateX", {})

-- Terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<A-t>",
  "<cmd>lua require('lspsaga.floaterm').open_float_terminal('')<CR>",
  {noremap = true}
)
vim.api.nvim_set_keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {})

-- Telescope File Pickers
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {}) -- "<cmd>DashboardFindFile<CR>" is a similar one
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", {}) -- "<cmd>DashboardFindWord<CR>" is a similar one
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", {})

-- Telescope vim Pickers
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>Telescope commands<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<CR>", {})
-- Telescope Git Pickers
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", {})
-- Telescope frequency
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {})

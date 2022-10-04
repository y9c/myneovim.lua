-- split windows
vim.keymap.set("n", "vv", "<C-w>v", {noremap = true})
vim.keymap.set("n", "ss", "<C-w>s", {noremap = true})

-- moving windows
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap = true})

-- save file
vim.keymap.set("n", "<F2>", ":w<CR>", {noremap = true})
vim.keymap.set("i", "<F2>", "<ESC>:w<CR>a", {noremap = true})

-- kill current buffer
vim.keymap.set("n", "<C-x>", ":bd<CR>", {noremap = true})

-- Better completion nav
-- vim.keymap.set('i', '<C-j>', [[\<C-n>]], {expr = true, noremap = true})
-- vim.keymap.set('i', '<C-k>', [[\<C-p>]], {expr = true, noremap = true})

-- moving tabs
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", {noremap = true})
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", {noremap = true})

-- toggle nvimtree explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.keymap.set("n", "<F3>", "<cmd>NvimTreeToggle<CR>", {noremap = true})

-- toggle vista viewer
vim.keymap.set("n", "<F4>", "<cmd>Vista!!<CR>", {noremap = true})

-- undo and redo
vim.keymap.set("n", "u", ":undo<CR>", {noremap = true})
vim.keymap.set("n", "U", ":redo<CR>", {noremap = true})

-- visual indent
vim.keymap.set("v", ">", ">gv", {noremap = true})
vim.keymap.set("v", "<", "<gv", {noremap = true})

-- toggle commentary (gcc is a map key, so noremap won't work!)
vim.keymap.set("n", "<Localleader>c", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("v", "<Localleader>c", ":CommentToggle<CR>", {noremap = true, silent = true})

-- Version control
-- mappings
vim.keymap.set("n", "<F7>", "<cmd>SignifyDiff<CR>", {noremap = true})
vim.keymap.set("n", "<Leader>gh", "<cmd>SignifyHunkDiff<CR>", {noremap = true})
vim.keymap.set("n", "<Leader>gu", "<cmd>SignifyHunkUndo<CR>", {noremap = true})
vim.keymap.set("n", "<Leader>gt", "<cmd>SignifyToggle<CR>", {noremap = true})

-- hunk jumping
vim.keymap.set("n", "[g", "<plug>(signify-prev-hunk)", {})
vim.keymap.set("n", "]g", "<plug>(signify-next-hunk)", {})

-- Packer
vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<CR>", {noremap = true})
vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<CR>", {noremap = true})
vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<CR>", {noremap = true})
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<CR>", {noremap = true})

-- LSP
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", {noremap = true})

vim.keymap.set("n", "<leader>ll", "<cmd>LspInstallInfo<CR>", {noremap = true})
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
vim.keymap.set("n", "]e", "n<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {noremap = true})

vim.keymap.set("n", "vd", "<cmd>Lspsaga preview_definition<CR>", {noremap = true})
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})

vim.keymap.set("n", "vr", "<cmd>Lspsaga lsp_finder<CR>", {noremap = true}) -- press `q` to close float term
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true})

vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {noremap = true})
vim.keymap.set("n", "va", "<cmd>Lspsaga code_action<CR>", {noremap = true})
vim.keymap.set("v", "va", "<cmd><C-U>Lspsaga range_code_action<CR>", {noremap = true})
vim.keymap.set("n", "vs", "<cmd>Lspsaga signature_help<CR>", {noremap = true})
vim.keymap.set("n", "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true})

-- Formatter
function run_formatter()
  local filetype = vim.bo.filetype
  local formatters = require("formatter.config").values.filetype[filetype]

  if vim.bo.modifiable then
    if not require("formatter.util").is_empty(formatters) then
      vim.api.nvim_command("Format")
    else
      vim.lsp.buf.formatting({})
    end
  end
end

vim.api.nvim_buf_set_keymap(0, "n", "<Localleader>f", "<cmd>lua run_formatter()<CR>", {noremap = true})

-- Auto header
-- vim.keymap.set("n", "<F7>", "<cmd>AddHeader<CR>", {noremap = true})
-- vim.keymap.set("i", "<F7>", "<cmd>AddHeader<CR>", {noremap = true})

-- Complete
-- vim.keymap.set("i", "<C-Space>", "cmp#complete()", {expr = true, silent = true})
-- vim.keymap.set("i", "<CR>", "cmp#confirm('<CR>')", {expr = true, silent = true})
-- vim.keymap.set("i", "<C-e>", "cmp#close('<C-e>')", {expr = true, silent = true})
-- vim.keymap.set("i", "<C-f>", "cmp#scroll({ 'delta': +4 })", {expr = true, silent = true})
-- vim.keymap.set("i", "<C-d>", "cmp#scroll({ 'delta': -4 })", {expr = true, silent = true})
-- vim.keymap.set("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.keymap.set("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.keymap.set("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.keymap.set("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Snippets Jump
--
vim.keymap.set(
  "i",
  "<C-n>",
  [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
  {noremap = false, expr = true}
)
vim.keymap.set(
  "s",
  "<C-n>",
  [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
  {noremap = false, expr = true}
)
vim.keymap.set(
  "i",
  "<C-p>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  {noremap = false, expr = true}
)
vim.keymap.set(
  "s",
  "<C-p>",
  [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  {noremap = false, expr = true}
)

-- Quick Jump

vim.keymap.set("n", "f", "<cmd>Pounce<CR>", {})
vim.keymap.set("n", "F", "<cmd>PounceRepeat<CR>", {})
vim.keymap.set("v", "f", "<cmd>Pounce<CR>", {})
-- omap gs <cmd>Pounce<CR>

-- Quick Run
vim.keymap.set("n", "<localleader>r", "<cmd>QuickRun -mode n<CR>", {noremap = true})
vim.keymap.set("v", "<localleader>r", "<cmd>QuickRun -mode v<CR>", {noremap = true})
vim.keymap.set("n", "<F5>", "<cmd>QuickRun -mode n<CR>", {noremap = true})
vim.keymap.set("v", "<F5>", "<cmd>QuickRun -mode v<CR>", {noremap = true})

-- Plugin MarkdownPreview
vim.keymap.set("n", "<C-p>", "<plug>MarkdownPreviewToggle", {})
vim.keymap.set("n", "<Leader>mv", "<plug>MarkdownPreviewToggle", {})

-- Translator
-- Echo translation in the cmdline
vim.keymap.set("n", "<Leader>te", "<Plug>Translate", {})
vim.keymap.set("n", "<Leader>te", "<Plug>TranslateV", {})
-- Display translation in a window
vim.keymap.set("n", "T", "<Plug>TranslateW", {})
vim.keymap.set("v", "T", "<Plug>TranslateWV", {})
-- Replace the text with translation
vim.keymap.set("n", "<Leader>tr", "<Plug>TranslateR", {})
vim.keymap.set("v", "<Leader>tr", "<Plug>TranslateRV", {})
-- Translate the text in clipboard
vim.keymap.set("n", "<Leader>ty", "<Plug>TranslateX", {})

-- Terminal
vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga open_floaterm<CR>", {silent = true, noremap = true})
vim.keymap.set("t", "<A-t>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", {silent = true, noremap = true})

-- Telescope File Pickers
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {}) -- "<cmd>DashboardFindFile<CR>" is a similar one
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", {}) -- "<cmd>DashboardFindWord<CR>" is a similar one
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", {})

-- Telescope vim Pickers
vim.keymap.set("n", "<leader>cc", "<cmd>Telescope commands<CR>", {})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<CR>", {})
-- Telescope Git Pickers
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>", {})
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", {})
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", {})
-- Telescope frequency
vim.keymap.set("n", "<leader>fm", "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {})

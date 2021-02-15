local k = require"astronauta.keymap"

local noremap = k.noremap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap

-- split windows
nnoremap{"vv", "<C-w>v"}
nnoremap{"ss", "<C-w>s"}

-- moving windows
nnoremap{"<C-j>", "<C-w>j"}
nnoremap{"<C-k>", "<C-w>k"}
nnoremap{"<C-h>", "<C-w>h"}
nnoremap{"<C-l>", "<C-w>l"}

-- save file
noremap{"<F2>", ":w<CR>"}
inoremap{"<F2>", "<ESC>:w<CR>"}

-- kill current buffer
noremap{"<C-x>", ":bd<CR>"}

-- Better completion nav
-- vim.api.nvim_set_keymap('i', '<C-j>', [[\<C-n>]], {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<C-k>', [[\<C-p>]], {expr = true, noremap = true})

-- moving tabs
nnoremap{"]b", ":BufferLineCycleNext<CR>"}
nnoremap{"[b", ":BufferLineCyclePrev<CR>"}

-- toggle nvimtree
nnoremap{"<leader>e", "<CMD>NvimTreeToggle<CR>"}

-- undo and redo
noremap{"u", ":undo<CR>"}
noremap{"U", ":redo<CR>"}

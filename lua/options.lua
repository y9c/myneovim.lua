vim.g.mapleader = " "
vim.g.maplocalleader = ";"
vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 15
vim.o.sidescrolloff = 5
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showmode = false

vim.o.clipboard = "unnamedplus"

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "number"
vim.wo.wrap = false

-- undo
vim.o.undofile = true
vim.bo.undofile = true
-- undodir default: $XDG_DATA_HOME/nvim/undo
-- vim.o.undodir = os.getenv('HOME') .. "/.cache/vim/undo"

-- Complete
vim.o.completeopt = "menuone,noselect"

-- Spelling
-- vim.wo.spell = true
vim.o.spellsuggest = "fast,12"
vim.o.spelloptions = "camel"
vim.o.fileformats = "unix,mac,dos"

-- clipboard speedup
if vim.env.TMUX then
  vim.g.clipboard = {
    name = "tmux-clipboard",
    copy = {
      ["+"] = {"tmux", "load-buffer", "-"},
      ["*"] = {"tmux", "load-buffer", "-"}
    },
    paste = {
      ["+"] = {"tmux", "save-buffer", "-"},
      ["*"] = {"tmux", "save-buffer", "-"}
    },
    cache_enabled = 1
  }
end

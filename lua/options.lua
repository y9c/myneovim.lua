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

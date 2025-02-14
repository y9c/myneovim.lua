-- vim.lsp.set_log_level("debug")

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
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showmode = false

vim.o.clipboard = "unnamedplus"

-- Complete
vim.o.completeopt = "menuone,noinsert,noselect"

-- vim.wo.signcolumn = "number"
vim.wo.wrap = false

-- indent
vim.b.tabstop = 2
vim.bo.tabstop = 2
vim.b.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.b.expandtab = true
vim.bo.expandtab = true
-- FileType autocommands
vim.cmd("autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab")
vim.cmd("autocmd FileType snakemake setlocal shiftwidth=4 tabstop=4 expandtab")
vim.cmd("autocmd FileType yaml setlocal foldmethod=indent foldlevelstart=1 foldnestmax=1 foldopen=all foldclose=all")

-- fold
vim.cmd("set nofoldenable")

-- show special(list) charaters
vim.o.listchars = "tab:»·,nbsp:+,trail:·,extends:☛,precedes:☚"
vim.cmd("set list")

-- line number
vim.wo.number = true
vim.wo.relativenumber = true

-- undo
vim.o.undofile = true
vim.bo.undofile = true
-- undodir default: $XDG_DATA_HOME/nvim/undo
-- vim.o.undodir = os.getenv('HOME') .. "/.cache/vim/undo"

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
elseif vim.loop.os_uname().sysname == "Darwin" then
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy"
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste"
    },
    cache_enabled = 0
  }
elseif vim.fn.executable("xsel") == 1 then
  vim.g.clipboard = {
    name = "xsel-clipboard",
    copy = {
      ["+"] = "xsel -i -b",
      ["*"] = "xsel -i -p"
    },
    paste = {
      -- ["+"] = "xsel -o -b",
      -- ["*"] = "xsel -o -p"
    },
    cache_enabled = 0
  }
end

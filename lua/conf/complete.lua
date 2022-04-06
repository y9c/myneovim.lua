local present, cmp = pcall(require, "cmp")
if not present then
  return
end

vim.opt.completeopt = "menuone,noselect"
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- nvim-cmp setup
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu =
        ({
        rg = "rg",
        nvim_lsp = "LSP",
        nvim_lua = "Lua",
        Path = "Path",
        luasnip = "LuaSnip",
        orgmode = "Org",
        treesitter = "ts",
        copilot = "co"
      })[entry.source.name]
      vim_item.kind =
        ({
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      })[vim_item.kind]
      return vim_item
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }
    -- ["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ["<S-Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end
  },
  sources = {
    {name = "vsnip"},
    {name = "path"}
  }
}

cmp.setup.cmdline(
  "/",
  {
    sources = {
      {name = "buffer"},
      {name = "path"}
    }
  }
)

local present, cmp = pcall(require, "cmp")
if not present then
  return
end

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {link = "CmpItemKindDefault", default = true})

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- nvim-cmp setup
cmp.setup {
  completion = {
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
      cmp.TriggerEvent.InsertEnter
    },
    completeopt = "menuone,noinsert,noselect",
    keyword_length = 0
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  experimental = {
    ghost_text = true
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu =
        ({
        nvim_lsp = "LSP",
        path = "Path",
        copilot = "AI",
        buffer = "Buffer",
        vsnip = "Snip"
      })[entry.source.name]
      vim_item.kind =
        ({
        Copilot = " ",
        Namespace = " ",
        Text = " ",
        Method = " ",
        Function = " ",
        Constructor = " ",
        Field = "ﰠ ",
        Variable = " ",
        Class = "ﴯ ",
        Interface = " ",
        Module = " ",
        Property = "ﰠ ",
        Unit = "塞 ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = "פּ ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
        Table = "",
        Object = " ",
        Tag = "",
        Array = "[]",
        Boolean = " ",
        Number = " ",
        Null = "ﳠ",
        String = " ",
        Calendar = "",
        Watch = " ",
        Package = ""
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
    ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),
    -- Shift+Enter works as Enter in windows terminal by default, so you have to reset the keybinding in setting.json
    -- Ref: https://github.com/microsoft/terminal/issues/530#issuecomment-755917602
    ["<S-CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ["<Right>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ["<Tab>"] = vim.schedule_wrap(
      function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
        else
          fallback()
        end
      end
    ),
    ["<S-Tab>"] = vim.schedule_wrap(
      function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
        else
          fallback()
        end
      end
    )
  },
  sources = cmp.config.sources(
    {
      {name = "copilot", keyword_length = 0, priority = 100},
      {name = "path", keyword_length = 0, priority = 2},
      {name = "nvim_lsp", keyword_length = 2, priority = 2},
      {name = "vsnip", keyword_length = 1, priority = 2}
    },
    {
      {name = "buffer", keyword_length = 0}
    }
  )
}

cmp.setup.cmdline(
  {"/", "?"},
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "buffer"},
        {name = "path"}
      }
    )
  }
)

local lspconfig = require "lspconfig"

local enhance_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = {
  "rust_analyzer",
  "gopls",
  "bashls",
  "perlls",
  "pyright",
  "r_language_server",
  "vimls"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach
  }
end

lspconfig.sumneko_lua.setup {
  cmd = {
    os.getenv("HOME") .. "/Tools/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    os.getenv("HOME") .. "/Tools/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim"}
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true}, {})
      }
    }
  }
}

-- https://github.com/glepnir/lspsaga.nvim

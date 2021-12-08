local lspconfig = require "lspconfig"

local enhance_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local enhance_capabilities = vim.lsp.protocol.make_client_capabilities()
-- enhance_capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  "ccls",
  "gopls",
  "rust_analyzer",
  "bashls",
  "pyright",
  "r_language_server",
  "julials",
  "perlls",
  "vimls",
  "tsserver"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach,
    capabilities = enhance_capabilities
  }
end

lspconfig.efm.setup {
  -- filetypes = {"yaml", "snakemake"},
  filetypes = {"yaml"},
  cmd = {
    "efm-langserver",
    "-c",
    vim.fn.stdpath("config") .. "/lua/conf/efm.yaml"
  },
  root_dir = function()
    return vim.fn.getcwd()
  end
}

lspconfig.sumneko_lua.setup {
  cmd = {
    -- os.getenv("HOME") .. "/Tools/lua-language-server/bin/Linux/lua-language-server",
    -- "-E",
    -- os.getenv("HOME") .. "/Tools/lua-language-server/main.lua"
    "lua-language-server"
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

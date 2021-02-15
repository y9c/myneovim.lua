local api = vim.api
local lspconfig = require "lspconfig"
local global = require "domain.global"
local saga = require "lspsaga"
local format = require("internal.format")

saga.init_lsp_saga()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local enhance_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.gopls.setup {
  cmd = {"gopls", "--remote=auto"},
  on_attach = enhance_attach,
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true
  }
}

lspconfig.sumneko_lua.setup {
  cmd = {
    global.home .. "/Tools/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    global.home .. "/Tools/lua-language-server/main.lua"
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

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    enhance_attach(client)
  end
}

lspconfig.clangd.setup(
  {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu"
    },
    init_options = {
      clangdFileStatus = true
    }
  }
)

local servers = {
  "dockerls",
  "bashls",
  "zls",
  "rust_analyzer",
  "pyright"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach
  }
end

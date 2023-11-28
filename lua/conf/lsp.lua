local lspconfig = require("lspconfig")

local enhance_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local enhance_capabilities = vim.lsp.protocol.make_client_capabilities()
-- enhance_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- "ccls",
-- "gopls",
-- "rust_analyzer",
-- "bashls",
-- "pyright",
-- "r_language_server",
-- "julials",
-- "perlls",
-- "vimls",
-- "tsserver"
-- local servers = {}
local servers = require("mason-lspconfig").get_installed_servers()

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach,
    capabilities = enhance_capabilities
  }
end

-- lspconfig.efm.setup {
--   -- filetypes = {"yaml", "snakemake"},
--   filetypes = {"yaml"},
--   cmd = {
--     "efm-langserver",
--     "-c",
--     vim.fn.stdpath("config") .. "/lua/conf/efm.yaml"
--   },
--   root_dir = function()
--     return vim.fn.getcwd()
--   end
-- }

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      }
    }
  }
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      keyOrdering = false
    }
  }
}

lspconfig.ruff_lsp.setup {
  on_attach = function(client, _)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
}

lspconfig.pyright.setup {
  on_attach = function(client, _)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.executeCommandProvider = false
  end,
  capabilities = {
    textDocument = {
      publishDiagnostics = {
        tagSupport = {
          valueSet = {2}
        }
      }
    }
  }
}
-- https://github.com/glepnir/lspsaga.nvim

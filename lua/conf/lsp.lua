local lspconfig = require("lspconfig")
-- lspconfig.sumneko_lua.setup {}

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
local servers = require "nvim-lsp-installer.servers".get_installed_server_names()

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

-- https://github.com/glepnir/lspsaga.nvim

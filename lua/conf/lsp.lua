local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local path = util.path

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

local function has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

if has_value(servers, "lua_ls") then
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
end

if has_value(servers, "yamlls") then
  lspconfig.yamlls.setup {
    settings = {
      yaml = {
        keyOrdering = false
      }
    }
  }
end

if has_value(servers, "ruff_lsp") then
  if vim.tbl_contains({"ruff_lsp"}, servers) then
    lspconfig.ruff_lsp.setup {
      on_attach = function(client, _)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    }
  end
end

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({"*", ".*"}) do
    -- fint pyenv
    -- print(workspace)
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(vim.fs.dirname(match), "bin", "python")
    end
    -- find poetry
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    print(match)
    if match ~= "" then
      local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
      return path.join(venv, "bin", "python")
    end
    -- find pipenv
    local match = vim.fn.glob(path.join(workspace, "Pipfile"))
    if match ~= "" then
      local venv = vim.fn.trim(vim.fn.system("pipenv --venv"))
      return path.join(venv, "bin", "python")
    end
  end

  -- Fallback to system Python.
  return exepath("python3") or exepath("python") or "python"
end

if has_value(servers, "pyright") then
  lspconfig.pyright.setup {
    before_init = function(_, config)
      config.settings.python.analysis.stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs"
      config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    on_attach = function(client, bufnr)
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
    },
    settings = {
      python = {
        analysis = {
          -- warnings in factory boy for meta class overide
          typeCheckingMode = "basic",
          reportImportCycles = false,
          reportMissingImports = false,
          reportUnusedImport = false
        }
      }
    }
  }
end

-- backup config
--
-- if vim.tbl_contains({"pyright"}, servers) then
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

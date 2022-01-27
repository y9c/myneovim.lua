local function lsp_servers()
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local servers = vim.lsp.get_active_clients()
  local result = {}
  if #servers == 0 then
    table.insert(result, "...")
  else
    for _, v in ipairs(servers) do
      if not vim.tbl_contains(result, v.name) and vim.tbl_contains(v.config.filetypes, buf_ft) then
        table.insert(result, v.name)
      end
    end
  end
  return (table.concat(result, ","))
end

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename", "location"},
    lualine_x = {"encoding", "fileformat"},
    lualine_y = {"filetype"},
    lualine_z = {
      {
        lsp_servers,
        color = {gui = "bold"}
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

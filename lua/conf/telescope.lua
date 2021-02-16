local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local utils = require("telescope.utils")

local conf = require("telescope.config").values

-- Built-in actions
local actions = require("telescope.actions")

-- Setup    =================================================================================
require("telescope").setup {
  defaults = {
    set_env = {["COLORTERM"] = "truecolor"},
    -- Global remapping
    mappings = {
      i = {
        ["<CR>"] = actions.goto_file_selection_edit + actions.center
      },
      n = {
        ["<esc>"] = actions.close
      }
    }
  }
}

-- Styles   =================================================================================

local M = {}

M.setupTelescopeHighlight = function()
  local palette = vim.g.momiji_palette
  local highlight = vim.fn["MomijiHighlight"]
  highlight("TelescopeSelection", {fg = palette.black, bg = palette.blue})
  highlight("TelescopeMultiSelection", {fg = palette.black, bg = palette.lightblue})
  highlight("TelescopeMatching", {fg = palette.lightyellow})
end

if vim.g.colors_name == "momiji" then
  M.setupTelescopeHighlight()
else
  vim.cmd [[ autocmd ColorScheme momiji ++once lua require('my-galaxyline').setupTelescopeHighlight() ]]
end

-- Commands =================================================================================

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  '<CMD>lua require("telescope.builtin").find_files()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  '<CMD>lua require("telescope.builtin").buffers()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fw",
  '<CMD>lua require("telescope.builtin").windows()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f:",
  '<CMD>lua require("telescope.builtin").command_history()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgs",
  '<CMD>lua require("telescope.builtin").git_status()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgr",
  '<CMD>lua require("my-telescope").git_recents()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgb",
  '<CMD>lua require("telescope.builtin").git_branches()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fgc",
  '<CMD>lua require("telescope.builtin").git_commits()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>flr",
  '<CMD>lua require("telescope.builtin").lsp_references()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fld",
  '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>flw",
  '<CMD>lua require("telescope.builtin").lsp_workspace_symbols()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fla",
  '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>',
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "v",
  "<Leader>fla",
  '<CMD>lua require("telescope.builtin").lsp_range_code_actions()<CR>',
  {noremap = true, silent = true}
)

vim.cmd [[
  command! ConfigEdit lua require("telescope.builtin").git_files({cwd = "~/.config"})
]]
vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>c",
  '<cmd>lua require("telescope.builtin").git_files({cwd = "~/.config"})<cr>',
  {noremap = true, silent = true}
)

vim.cmd [[
  command! PackerEdit lua require("telescope.builtin").find_files({search_dirs = {"~/.local/share/nvim/site/pack/packer"}})
]]
vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>p",
  '<cmd>lua require("telescope.builtin").find_files({search_dirs = {"~/.local/share/nvim/site/pack/packer"}})<cr>',
  {noremap = true, silent = true}
)

local my = {}
my.git_recents = function(opts)
  local opts = opts or {}
  local depth = utils.get_default(opts.depth, 5)

  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  end

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(
    opts,
    {
      prompt_title = "Git Recents",
      finder = finders.new_oneshot_job({"git", "diff", "--name-only", depth and "HEAD~" .. depth or "HEAD"}, opts),
      previewer = conf.file_previewer(opts),
      sorter = conf.file_sorter(opts)
    }
  ):find()
end

return my

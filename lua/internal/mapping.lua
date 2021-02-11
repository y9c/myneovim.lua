local pbind = require("publibs.plbind")
local map_cr = pbind.map_cr
local map_cu = pbind.map_cu
local map_cmd = pbind.map_cmd
local map_args = pbind.map_args
local vim = vim

local mapping = setmetatable({}, {__index = {vim = {}, plugin = {}}})

local function check_back_space()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

function mapping:load_vim_define()
  self.vim = {
    -- Vim map
    ["n|<C-x>k"] = map_cr("Bdelete"):with_noremap():with_silent(),
    ["n|<C-s>"] = map_cu("write"):with_noremap(),
    ["n|Y"] = map_cmd("y$"),
    ["n|]w"] = map_cu("WhitespaceNext"):with_noremap(),
    ["n|[w"] = map_cu("WhitespacePrev"):with_noremap(),
    ["n|]b"] = map_cu("bp"):with_noremap(),
    ["n|[b"] = map_cu("bn"):with_noremap(),
    ["n|<C-x>"] = map_cu("bd"):with_noremap(),
    ["n|<Space>cw"] = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|U"] = map_cmd("<C-r>"):with_noremap(),
    ["n|<A-[>"] = map_cr("vertical resize -5"),
    ["n|<A-]>"] = map_cr("vertical resize +5"),
    ["n|<C-q>"] = map_cmd(":wq<CR>"),
    ["n|<Leader>ss"] = map_cu("SessionSave"):with_noremap(),
    ["n|<Leader>sl"] = map_cu("SessionLoad"):with_noremap(),
    -- Insert
    ["i|<C-w>"] = map_cmd("<C-[>diwa"):with_noremap(),
    ["i|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["i|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["i|<C-k>"] = map_cmd("<ESC>d$a"):with_noremap(),
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["i|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
    ["i|<C-j>"] = map_cmd("<Esc>o"):with_noremap(),
    ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
    ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
    ["i|<C-e>"] = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
    ["i|<TAB>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
    ["i|<S-TAB>"] = map_cmd([[pumvisible() ? "\<C-p>" : "\<C-h>"]]):with_noremap():with_expr(),
    ["i|<CR>"] = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_nowait(

    ),
    -- command line
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap()
  }
end

function mapping:load_plugin_define()
  self.plugin = {
    -- person keymap
    ["n|mf"] = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap(

    ),
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<C-f>"] = map_cmd("<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>"):with_silent():with_noremap():with_nowait(

    ),
    ["n|<C-b>"] = map_cmd("<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>"):with_silent():with_noremap():with_nowait(

    ),
    ["n|[e"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
    ["n|]e"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|ga"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
    ["v|ga"] = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|gd"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
    ["n|gD"] = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|gs"] = map_cr("Lspsaga signature_hlep"):with_noremap():with_silent(),
    ["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
    ["n|gh"] = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent(),
    ["n|gt"] = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>cw"] = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ce"] = map_cr("Lspsaga show_line_diagnostics"):with_noremap():with_silent(),
    ["n|<Leader>ct"] = map_args("Template"),
    -- dein
    ["n|<Leader>tr"] = map_cr("call dein#recache_runtimepath()"):with_noremap():with_silent(),
    ["n|<Leader>tf"] = map_cu("DashboardNewFile"):with_noremap():with_silent(),
    -- mhinz/vim-signify
    ["n|[g"] = map_cmd("<plug>(signify-next-hunk)"),
    ["n|]g"] = map_cmd("<plug>(signify-prev-hunk)"),
    -- Plugin nvim-tree
    ["n|<Leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    ["n|<Leader>F"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>om"] = map_cu("MarkdownPreview"):with_noremap():with_silent(),
    -- Plugin DadbodUI
    ["n|<Leader>od"] = map_cr("DBUIToggle"):with_noremap():with_silent(),
    -- Plugin Floaterm
    ["n|<A-d>"] = map_cu("Lspsaga open_floaterm"):with_noremap():with_silent(),
    ["t|<A-d>"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap():with_silent(),
    -- Far.vim
    ["n|<Leader>fz"] = map_cr("Farf"):with_noremap():with_silent(),
    ["v|<Leader>fz"] = map_cr("Farf"):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>bb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
    ["n|<Leader>fa"] = map_cu("DashboardFindWord"):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu("DashboardJumpMark"):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu("DashboardFindFile"):with_noremap():with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu("Telescope grep_string"):with_noremap():with_silent(),
    ["n|<Leader>fh"] = map_cu("DashboardFindHistory"):with_noremap():with_silent(),
    ["n|<Leader>fl"] = map_cu("Telescope loclist"):with_noremap():with_silent(),
    ["n|<Leader>fc"] = map_cu("Telescope git_commits"):with_noremap():with_silent(),
    ["n|<Leader>ft"] = map_cu("Telescope help_tags"):with_noremap():with_silent(),
    ["n|<Leader>fd"] = map_cu("Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles"):with_noremap():with_silent(

    ),
    ["n|<Leader>fs"] = map_cu("Telescope gosource"):with_noremap():with_silent(),
    -- prodoc
    ["n|gcc"] = map_cu("ProComment"):with_noremap():with_silent(),
    ["x|gcc"] = map_cr("ProComment"),
    ["n|gcj"] = map_cu("ProDoc"):with_silent():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"] = map_cmd("<Plug>(accelerated_jk_gj)"):with_silent(),
    ["n|k"] = map_cmd("<Plug>(accelerated_jk_gk)"):with_silent(),
    -- Plugin QuickRun
    ["n|<Leader>r"] = map_cr("<cmd>lua require('internal.selfunc').run_command()<CR>"):with_noremap():with_silent(),
    -- Plugin Format code
    ["n|<Localleader>f"] = map_cr("<cmd>lua vim.api.nvim_command('Format')<CR>"):with_noremap():with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"] = map_cu("Vista!!"):with_noremap():with_silent(),
    -- Plugin vim-operator-replace
    ["x|p"] = map_cmd("<Plug>(operator-replace)"),
    -- Plugin vim-operator-surround
    ["n|sa"] = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    ["n|sd"] = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    ["n|sr"] = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"] = map_cmd("<Plug>(eft-repeat)"),
    ["x|;"] = map_cmd("<Plug>(eft-fepeat)"),
    ["n|f"] = map_cmd("<Plug>(eft-f)"),
    ["x|f"] = map_cmd("<Plug>(eft-f)"),
    ["o|f"] = map_cmd("<Plug>(eft-f)"),
    ["n|F"] = map_cmd("<Plug>(eft-F)"),
    ["x|F"] = map_cmd("<Plug>(eft-F)"),
    ["o|F"] = map_cmd("<Plug>(eft-F)")
  }
end

local function load_mapping()
  mapping:load_vim_define()
  mapping:load_plugin_define()
  pbind.nvim_load_mapping(mapping.vim)
  pbind.nvim_load_mapping(mapping.plugin)
end

load_mapping()

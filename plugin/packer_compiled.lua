-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/yec/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/yec/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/yec/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/yec/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/yec/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["compe-tabnine"] = {
    after_files = { "/Users/yec/.local/share/nvim/site/pack/packer/opt/compe-tabnine/after/plugin/compe_tabnine.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/compe-tabnine"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.dashboard\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.formatter\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.statusline\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¨\6\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\1\0\4\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\vbuffer\2\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\fnoremap\2\nsigns\1\0\a\vlinehl\1\nnumhl\1\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\1\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\6~\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\6_\vchange\1\0\4\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nﬁ\5\0\0\3\0\15\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0006\0\0\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\1\r\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\tcase&indent_blankline_context_patterns*indent_blankline_show_current_context4indent_blankline_show_trailing_blankline_indent\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\1\21\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level\b‚îÇ\26indent_blankline_char\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.bufferline\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.complete\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.lsp\frequire\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/nvim-lspupdate"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen" },
    config = { "\27LJ\2\nå\2\0\0\3\0\t\0\0196\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0005\2\a\0=\2\b\1=\1\5\0K\0\1\0\bgit\1\0\5\runmerged\b‚â†\vstaged\b‚úö\runstaged\b‚úö\14untracked\b‚òÖ\frenamed\b‚â´\1\0\2\fdefault\bÔÖú\fsymlink\bÔíÅ\20nvim_tree_icons\29nvim_tree_indent_markers\28nvim_tree_hide_dotfiles\21nvim_tree_follow\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\n¿\3\0\0\6\0\21\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0005\4\f\0=\4\r\3=\3\14\0025\3\18\0005\4\15\0005\5\16\0=\5\17\4=\4\19\3=\3\20\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\fhaskell\1\0\1\venable\2\19ignore_install\1\0\1\21ensure_installed\ball\1\2\0\0\fhaskell\nsetup\28nvim-treesitter.configs\frequire,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\17nvim_command\bapi\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "nvim-treesitter" },
    loaded = true,
    only_config = true
  },
  ["vim-cursorword"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-cursorword"
  },
  ["vim-eft"] = {
    config = { "\27LJ\2\nã\2\0\0\3\0\v\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\1=\1\3\0K\0\1\0\6n\1\0\3\14highlight\15EftSubChar\19allow_operator\1\16allow_space\1\0062\1\0\3\14highlight\15EftSubChar\19allow_operator\1\16allow_space\1\0061\1\0\0\1\0\3\14highlight\fEftChar\19allow_operator\2\16allow_space\2\18eft_highlight\19eft_ignorecase\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-eft"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-quickrun"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-quickrun"
  },
  ["vim-translator"] = {
    config = { "\27LJ\2\n|\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\4\0\0\tbing\nhaici\vyoudao\31translator_default_engines\30translator_history_enable\6g\bvim\0" },
    loaded = true,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/start/vim-translator"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n \2\0\0\4\0\19\0\0256\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\1\0005\1\t\0005\2\b\0=\2\n\0015\2\v\0=\2\f\0015\2\r\0=\2\14\0015\2\15\0=\2\16\0015\2\17\0=\2\18\1=\1\a\0K\0\1\0\vsbatch\1\3\0\0\vsbatch\ash\14snakemake\1\3\0\0\14snakemake\vpython\bvue\1\4\0\0\bvue\15javascript\thtml\20typescriptreact\1\3\0\0\15typescript\thtml\20javascriptreact\1\0\0\1\3\0\0\15javascript\thtml\20vsnip_filetypes\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\n∫\3\0\0\2\0\14\0\0296\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0K\0\1\0\1\0\5\15typescript\rnvim_lsp\20typescriptreact\rnvim_lsp\rmarkdown\btoc\fvimwiki\rmarkdown\vpandoc\rmarkdown\24vista_executive_for\rmarkdown\28vista_vimwiki_executive\17floating_win\31vista_echo_cursor_strategy\nctags\28vista_default_executive\1\3\0\0\15‚ï∞‚îÄ‚ñ∏ \15‚îú‚îÄ‚ñ∏ \22vista_icon_indent\29vista_disable_statusline\31vista#renderer#enable_icon\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yec/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-quickrun
time([[Setup for vim-quickrun]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\3\0\a\0\v6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0K\0\1\0\trust\1\0\0\1\0\1\ttype\15rust/cargo\20quickrun_config%quickrun_no_default_key_mappings\6g\bvim\0", "setup", "vim-quickrun")
time([[Setup for vim-quickrun]], false)
time([[packadd for vim-quickrun]], true)
vim.cmd [[packadd vim-quickrun]]
time([[packadd for vim-quickrun]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¨\6\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\1\0\4\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\vbuffer\2\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\fnoremap\2\nsigns\1\0\a\vlinehl\1\nnumhl\1\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\1\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\6~\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\6_\vchange\1\0\4\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-translator
time([[Config for vim-translator]], true)
try_loadstring("\27LJ\2\n|\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\4\0\0\tbing\nhaici\vyoudao\31translator_default_engines\30translator_history_enable\6g\bvim\0", "config", "vim-translator")
time([[Config for vim-translator]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'compe-tabnine', 'nvim-autopairs', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'vim-vsnip'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

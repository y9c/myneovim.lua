" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/yc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.dashboard\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.formatter\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.statusline\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\22indent_tab_guides\1\24indent_space_guides\2\23indent_start_level\3\1\22indent_guide_size\3\1\18indent_levels\3\30\nsetup\18indent_guides\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.bufferline\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.lsp\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-lspupdate"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yc/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2E<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>\15<Leader>fm\6n\20nvim_set_keymap\bapi\bvim\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0" },
    loaded = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yc/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-matchup"] = {
    after_files = { "/home/yc/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/yc/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-quickrun"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\31<plug>QuickRun -mode v<cr>\6v\1\0\2\vsilent\2\fnoremap\2\31<plug>QuickRun -mode n<cr>\14<leader>r\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yc/.local/share/nvim/site/pack/packer/opt/vim-quickrun"
  }
}

-- Setup for: vim-quickrun
try_loadstring("\27LJ\2\nB\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0%quickrun_no_default_key_mappings\6g\bvim\0", "setup", "vim-quickrun")
vim.cmd [[packadd vim-quickrun]]
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.statusline\frequire\0", "config", "galaxyline.nvim")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: indent-guides.nvim
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\22indent_tab_guides\1\24indent_space_guides\2\23indent_start_level\3\1\22indent_guide_size\3\1\18indent_levels\3\30\nsetup\18indent_guides\frequire\0", "config", "indent-guides.nvim")
-- Config for: dashboard-nvim
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.dashboard\frequire\0", "config", "dashboard-nvim")
-- Config for: vim-quickrun
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\31<plug>QuickRun -mode v<cr>\6v\1\0\2\vsilent\2\fnoremap\2\31<plug>QuickRun -mode n<cr>\14<leader>r\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-quickrun")
-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.bufferline\frequire\0", "config", "nvim-bufferline.lua")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0", "config", "telescope.nvim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: formatter.nvim
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.formatter\frequire\0", "config", "formatter.nvim")
-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\2\n�\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2E<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>\15<Leader>fm\6n\20nvim_set_keymap\bapi\bvim\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

#! /usr/bin/env lua
--
-- plugins.lua
-- Copyright (C) 2021 Ye Chang <yech1990@gmail.com>
--
-- Distributed under terms of the MIT license.
--

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end

    local execute = vim.api.nvim_command
    local fn = vim.fn

    local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"

    return
end

return require("packer").startup(
    function()
        -- Packer can manage itself as an optional plugin
        use {"wbthomason/packer.nvim", opt = true}

        -- Load on specific commands
        use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

        -- Load on an autocommand event
        use {"andymass/vim-matchup", event = "VimEnter *"}

        use {
            "akinsho/nvim-bufferline.lua",
	    config = function() require("conf.bufferline") end,
            requires = {"kyazdani42/nvim-web-devicons"}
        }

        use {
            "glepnir/galaxyline.nvim",
            branch = "main",
	    config = function() require("conf.statusline") end,
	    requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

        use {"glepnir/dashboard-nvim", config = function()
                require("conf.dashboard")
            end}

        use {"liuchengxu/vim-clap"}

        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/nvim-treesitter-refactor"

	-- lua keymap
        use "tjdevries/astronauta.nvim"

	-- speed up jk
	use "rhysd/accelerated-jk"

	-- Indent Guides
	use {
		"glepnir/indent-guides.nvim",
		config = function() require('indent_guides').setup({ 
			indent_levels = 30,
			indent_guide_size = 1,
			indent_start_level = 1,
			indent_space_guides = true,
			indent_tab_guides = false,
		}) end}

    end
)

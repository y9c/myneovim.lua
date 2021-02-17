#! /usr/bin/env lua

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

local packer = require("packer")

packer.init(
  {
    ensure_dependencies = true,
    git = {
      cmd = "git",
      depth = 1,
      clone_timeout = 600
    }
  }
)

return packer.startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- Load on specific commands
    use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

    -- Load on an autocommand event
    use {"andymass/vim-matchup", event = "VimEnter *"}

    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("conf.bufferline")
      end,
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = function()
        require("conf.statusline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("conf.dashboard")
      end
    }

    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-refactor"

    -- lua keymap
    use "tjdevries/astronauta.nvim"

    -- speed up jk
    use "rhysd/accelerated-jk"

    -- Indent Guides
    use {
      "glepnir/indent-guides.nvim",
      config = function()
        require("indent_guides").setup(
          {
            indent_levels = 30,
            indent_guide_size = 1,
            indent_start_level = 1,
            indent_space_guides = true,
            indent_tab_guides = false
          }
        )
      end
    }

    -- Commentary
    use "tomtom/tcomment_vim"

    -- Color highlighter
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- QuickRun
    use {
      "thinca/vim-quickrun",
      setup = function()
        vim.g.quickrun_no_default_key_mappings = 1
      end,
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>r", "<plug>QuickRun -mode n<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("v", "<leader>r", "<plug>QuickRun -mode v<cr>", {silent = true, noremap = true})
      end
    }

    -- Fuzzy finder
    -- use {"liuchengxu/vim-clap"}

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("conf.telescope")
      end
    }

    use {
      "nvim-telescope/telescope-frecency.nvim",
      requires = {
        "tami5/sql.nvim"
      },
      config = function()
        require "telescope".load_extension("frecency")
        vim.api.nvim_set_keymap(
          "n",
          "<Leader>fm",
          "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
          {noremap = true, silent = true}
        )
      end
    }

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeOpen"},
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        vim.g.nvim_tree_follow = 1
        vim.g.nvim_tree_hide_dotfiles = 1
        vim.g.nvim_tree_indent_markers = 1
        vim.g.nvim_tree_bindings = {
          edit = {"<CR>", "l"},
          edit_vsplit = "s",
          edit_split = "i"
        }
        vim.g.nvim_tree_icons = {
          default = "",
          symlink = "",
          git = {
            unstaged = "✚",
            staged = "✚",
            unmerged = "≠",
            renamed = "≫",
            untracked = "★"
          }
        }
      end
    }

    -- Version control
    use {
      "mhinz/vim-signify",
      event = {"BufReadPre *", "BufNewFile *"},
      config = function()
        vim.g.signify_sign_add = "▋"
        vim.g.signify_sign_change = "▋"
        vim.g.signify_sign_delete = "▋"
        vim.g.signify_sign_delete_first_line = "▘"
        vim.g.signify_sign_show_count = 0
      end
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "conf.lsp"
      end
    }
    use {
      "alexaandru/nvim-lspupdate"
    }
    use "glepnir/lspsaga.nvim"

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("conf.formatter")
      end
    }

    -- Complete
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter *",
      config = function()
        require("conf.complete")
      end
    }

    use {
      "hrsh7th/vim-vsnip",
      event = "InsertCharPre *"
    }
  end
)

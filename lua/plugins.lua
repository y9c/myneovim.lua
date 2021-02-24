#! /usr/bin/env lua

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

local execute = vim.api.nvim_command

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes): ") ~= "y" then
    return
  end

  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute("packadd packer.nvim")
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

    -- Load on an autocommand event
    use {"andymass/vim-matchup", event = "VimEnter *"}

    -- Buffer Line (top)
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("conf.bufferline")
      end,
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- Status Line (bottom)
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = function()
        require("conf.statusline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- Startup window
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("conf.dashboard")
      end
    }

    -- Syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead *",
      after = "telescope.nvim",
      config = function()
        vim.api.nvim_command("set foldmethod=expr")
        vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
        require "nvim-treesitter.configs".setup {
          highlight = {
            enable = true
          },
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
              }
            }
          },
          ensure_installed = "all"
        }
      end
    }
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter"
    }

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
            even_colors = {fg = "NONE", bg = "#23272E"},
            odd_colors = {fg = "NONE", bg = "#23272E"}
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
          ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
          ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
          ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>"
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
    -- view LSP symbol and tags
    use {
      "liuchengxu/vista.vim",
      cmd = "Vista",
      config = function()
        vim.g["vista#renderer#enable_icon"] = 1
        vim.g.vista_disable_statusline = 1
        vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
        vim.g.vista_default_executive = "ctags"
        vim.g.vista_echo_cursor_strategy = "floating_win"
        vim.g.vista_vimwiki_executive = "markdown"
        vim.g.vista_executive_for = {
          vimwiki = "markdown",
          pandoc = "markdown",
          markdown = "toc",
          typescript = "nvim_lsp",
          typescriptreact = "nvim_lsp"
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

    -- markdown language
    if (vim.env.DISPLAY) then
      use {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install",
        config = function()
          vim.g.mkdp_auto_start = 0
        end
      }
    end

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

    -- use { "tzachar/compe-tabnine", run = "./install.sh" }

    -- Translator
    use {
      "voldikss/vim-translator",
      config = function()
        vim.g.translator_history_enable = true
        vim.g.translator_default_engines = {"bing", "haici", "youdao"}
      end
    }
  end
)

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

    -- NerdIcons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("conf.devicons")
      end,
    }

    -- Buffer Line (top)
    use {
      "akinsho/bufferline.nvim",
      config = function()
        require("conf.bufferline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- Status Line (bottom)
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("conf.statusline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- Startup window
    -- use {
    --   "glepnir/dashboard-nvim",
    --   config = function()
    --     require("conf.dashboard")
    --   end
    -- }
    use {
      "goolord/alpha-nvim",
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
          ignore_install = {"haskell"},
          highlight = {
            enable = true,
            disable = {"haskell"}
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

    -- speed up jk
    use "rhysd/accelerated-jk"

    -- Indent Guides
    -- use {
    --   "glepnir/indent-guides.nvim",
    --   config = function()
    --     require("indent_guides").setup(
    --       {
    --         even_colors = {fg = "NONE", bg = "#23272E"},
    --         odd_colors = {fg = "NONE", bg = "#23272E"}
    --       }
    --     )
    --   end
    -- }
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        vim.g.indent_blankline_char = "│"
        vim.g.indent_blankline_show_first_indent_level = true
        vim.g.indent_blankline_filetype_exclude = {
          "startify",
          "dashboard",
          "dotooagenda",
          "log",
          "fugitive",
          "gitcommit",
          "packer",
          "vimwiki",
          "markdown",
          "txt",
          "vista",
          "help",
          "todoist",
          "NvimTree",
          "peekaboo",
          "git",
          "TelescopePrompt",
          "undotree",
          "flutterToolsOutline",
          "" -- for all buffers without a file type
        }
        vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_current_context = true
        vim.g.indent_blankline_context_patterns = {
          "class",
          "function",
          "method",
          "block",
          "list_literal",
          "selector",
          "^if",
          "^table",
          "if_statement",
          "while",
          "for",
          "case"
        }
        -- because lazy load indent-blankline so need readd this autocmd
        vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
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

    use {
      "itchyny/vim-cursorword",
      event = {"BufReadPre *", "BufNewFile *"}
    }

    -- Qucik Jump
    use {
      "hrsh7th/vim-eft",
      opt = true,
      config = function()
        vim.g.eft_ignorecase = true
        vim.g.eft_highlight = {
          ["1"] = {
            highlight = "EftChar",
            allow_space = true,
            allow_operator = true
          },
          ["2"] = {
            highlight = "EftSubChar",
            allow_space = false,
            allow_operator = false
          },
          ["n"] = {
            highlight = "EftSubChar",
            allow_space = false,
            allow_operator = false
          }
        }
      end
    }
    -- run code
    -- use {"CRAG666/code_runner.nvim"}
    -- QuickRun
    use {"lambdalisue/vim-quickrun-neovim-job"}
    use {
      "thinca/vim-quickrun",
      setup = function()
        vim.g.quickrun_no_default_key_mappings = 1
        vim.g.quickrun_config = {
          _ = {runner = "neovim_job"},
          rust = {type = "rust/cargo"}
        }
      end
    }

    -- Fuzzy finder
    -- use {"liuchengxu/vim-clap"}

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzy-native.nvim"}
      },
      config = function()
        require("conf.telescope")
      end
    }

    -- use {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   requires = {
    --     "tami5/sql.nvim"
    --   },
    --   config = function()
    --     require "telescope".load_extension("frecency")
    --   end
    -- }

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeOpen"},
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        vim.g.nvim_tree_follow = 1
        vim.g.nvim_tree_hide_dotfiles = 1
        vim.g.nvim_tree_indent_markers = 1
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
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("gitsigns").setup {
          signs = {
            add = {hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
            change = {hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
            delete = {hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
            topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
            changedelete = {
              hl = "GitSignsChange",
              text = "~",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn"
            }
          },
          numhl = false,
          linehl = false,
          keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            -- Text objects
            ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
            ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
          },
          current_line_blame = false,
          sign_priority = 6,
          update_debounce = 100,
          status_formatter = nil,
          watch_gitdir = {interval = 1000},
          diff_opts = {interval = true}
        }
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
      "windwp/nvim-autopairs",
      event = "InsertEnter *",
      config = function()
        require("nvim-autopairs").setup(
          {
            disable_filetype = {"TelescopePrompt", "vim"}
          }
        )
      end
    }

    use {
      "hrsh7th/vim-vsnip",
      event = "InsertCharPre *",
      config = function()
        vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
        vim.g.vsnip_filetypes = {
          javascriptreact = {"javascript", "html"},
          typescriptreact = {"typescript", "html"},
          vue = {"vue", "javascript", "html"},
          snakemake = {"snakemake", "python"},
          sbatch = {"sbatch", "sh"}
        }
      end
    }

    -- use {
    --   "hrsh7th/nvim-compe",
    --   event = "InsertEnter *",
    --   config = function()
    --     require("conf.complete")
    --   end
    -- }

    -- use {
    --   "tzachar/compe-tabnine",
    --   opt = true,
    --   after = "nvim-compe",
    --   run = "./install.sh",
    --   requires = "hrsh7th/nvim-compe"
    -- }

    use "github/copilot.vim"

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

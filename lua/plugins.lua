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
  function(use)
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- Load on an autocommand event
    use {"andymass/vim-matchup", event = "VimEnter *"}

    -- NerdIcons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("conf.devicons")
      end
    }

    -- Buffer Line (top)
    use {
      "akinsho/bufferline.nvim",
      config = function()
        require("conf.bufferline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- UI: Status Line (bottom)
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("conf.statusline")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- UI: Startup window
    use {
      "goolord/alpha-nvim",
      config = function()
        require("conf.dashboard")
      end
    }

    -- UI: Scroll bar
    use {
      "petertriho/nvim-scrollbar",
      requires = {"kevinhwang91/nvim-hlslens"},
      config = function()
        require("scrollbar").setup(
          {
            handle = {
              text = " ",
              color = "#f8f8f2",
              cterm = nil
            },
            marks = {
              Search = {color = "#97be65"}
            }
          }
        )
        require("scrollbar.handlers.search").setup()
        vim.cmd(
          [[
          highlight HlSearchLensNear guifg=#DDDDDD guibg=#000000 gui=italic
          highlight HlSearchLens     guifg=#999999 guibg=#202020 gui=italic
        ]]
        )
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
          ignore_install = {"haskell", "phpdoc"},
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

    -- Qucik Jump (move cursor)
    use "rlane/pounce.nvim"

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
        require "nvim-tree".setup {
          auto_close = true,
          open_on_tab = false
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
      "williamboman/nvim-lsp-installer",
      {
        "neovim/nvim-lspconfig",
        config = function()
          require("nvim-lsp-installer").setup {}
          require "conf.lsp"
        end
      }
    }

    use "tami5/lspsaga.nvim"

    -- language: markdown
    if (vim.env.DISPLAY or vim.fn.has("macunix")) then
      use {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install",
        config = function()
          vim.g.mkdp_auto_start = 0
        end
      }
    end

    -- language: singularity def
    use {
      "singularityware/singularity.lang",
      rtp = "vim",
      ft = "singularity"
    }

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("conf.formatter")
      end
    }

    -- Auto header completion
    -- use {
    --   "alpertuna/vim-header",
    --   event = "BufRead",
    --   config = function()
    --     vim.g.header_field_author = ""
    --     vim.g.header_field_author_email = ""
    --     vim.g.header_field_timestamp_format = "%Y-%m-%d %H:%M"
    --     vim.g.field_modified_date = "xxxxx:"
    --     vim.g.header_auto_add_header = 1
    --     vim.g.header_field_filename = 0
    --     vim.g.header_field_modified_by = 0
    --   end
    -- }

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
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require("conf.complete")
      end
    }

    use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp"
    }

    use {
      "hrsh7th/cmp-vsnip",
      after = "nvim-cmp"
    }
    use {
      "hrsh7th/vim-vsnip",
      after = "nvim-cmp",
      config = function()
        vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets/"
      end
    }

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

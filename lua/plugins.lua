local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    -- "folke/which-key.nvim",
    {"folke/neoconf.nvim", cmd = "Neoconf"},
    "folke/neodev.nvim",
    -- Load on an autocommand event
    {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = {method = "popup"}
      end
    },
    -- NerdIcons
    {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("conf.devicons")
      end
    },
    -- Buffer Line (top)
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("conf.bufferline")
      end,
      dependencies = {"kyazdani42/nvim-web-devicons", lazy = true}
    },
    -- UI: Status Line (bottom)
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("conf.statusline")
      end,
      dependencies = {"kyazdani42/nvim-web-devicons", lazy = true}
    },
    -- UI: Startup window
    {
      "goolord/alpha-nvim",
      config = function()
        require("conf.dashboard")
      end
    },
    -- UI: Scroll bar
    {
      "petertriho/nvim-scrollbar",
      -- dependencies = {"kevinhwang91/nvim-hlslens"},
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
        -- require("scrollbar.handlers.search").setup()
        vim.cmd(
          [[
          highlight HlSearchLensNear guifg=#DDDDDD guibg=#000000 gui=italic
          highlight HlSearchLens     guifg=#999999 guibg=#202020 gui=italic
        ]]
        )
      end
    },
    -- Syntax
    {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      dependencies = {"nvim-telescope/telescope.nvim"},
      config = function()
        vim.api.nvim_command("set foldmethod=expr")
        vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
        require "nvim-treesitter.configs".setup {
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
          matchup = {
            enable = true
          },
          ignore_install = {"haskell", "phpdoc", "swift"},
          -- ensure_installed = "all"
          ensure_installed = {
            "c",
            "cpp",
            "go",
            "rust",
            "lua",
            "python",
            "perl",
            "r",
            "bash",
            "typescript",
            "javascript",
            "html",
            "json",
            "toml",
            "yaml",
            "markdown",
            "markdown_inline"
          }
        }
      end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = {"nvim-treesitter"}
    },
    -- speed up jk
    "rainbowhxch/accelerated-jk.nvim",
    -- Indent Guides
    {
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
      end
    },
    -- Commentary
    {
      "terrortylor/nvim-comment",
      config = function()
        require("nvim_comment").setup()
      end
    },
    -- Color highlighter
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    },
    {
      "itchyny/vim-cursorword",
      event = {"BufReadPre", "BufNewFile"}
    },
    -- Qucik Jump (move cursor)
    "rlane/pounce.nvim",
    -- run code
    --,{"CRAG666/code_runner.nvim"}
    -- QuickRun
    {"lambdalisue/vim-quickrun-neovim-job"},
    {
      "thinca/vim-quickrun",
      config = function()
        vim.g.quickrun_no_default_key_mappings = 1
        vim.g.quickrun_config = {
          _ = {runner = "neovim_job"},
          rust = {type = "rust/cargo"}
        }
      end
    },
    -- Fuzzy finder
    --,{"liuchengxu/vim-clap"}

    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzy-native.nvim"}
      },
      config = function()
        require("conf.telescope")
      end
    },
    --,{
    --   "nvim-telescope/telescope-frecency.nvim",
    --   dependencies = {
    --     "tami5/sql.nvim"
    --   },
    --   config = function()
    --     require "telescope".load_extension("frecency")
    --   end
    -- }

    -- File explorer
    {
      "kyazdani42/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeOpen"},
      dependencies = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require "nvim-tree".setup {
          view = {
            adaptive_size = true
          },
          open_on_tab = false
        }
      end
    },
    -- view LSP symbol and tags
    {
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
    },
    -- Version control
    {
      "lewis6991/gitsigns.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("gitsigns").setup {}
      end
    },
    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup(
          {
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
              }
            }
          }
        )
        require("conf.lsp")
      end
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local nls = require("null-ls")
        nls.setup(
          {
            sources = {
              nls.builtins.completion.spell,
              nls.builtins.code_actions.gitsigns
            }
          }
        )
      end
    },
    {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").setup(
          {
            lightbulb = {
              sign = false
            }
          }
        )
      end
    },
    -- language: markdown
    -- if (vim.env.DISPLAY or vim.fn.has("macunix")) then
    --  {
    --     "iamcco/markdown-preview.nvim",
    --     ft = "markdown",
    --     run = "cd app && yarn install",
    --     config = function()
    --       vim.g.mkdp_auto_start = 0
    --     end
    --   }
    -- end

    -- language: singularity def
    {
      "singularityware/singularity.lang",
      ft = "singularity"
    },
    -- language: R
    -- {
    --   "quarto-dev/quarto-nvim",
    --   dependencies = {
    --     "jmbuhr/otter.nvim",
    --     "hrsh7th/nvim-cmp",
    --     "neovim/nvim-lspconfig",
    --     "nvim-treesitter/nvim-treesitter"
    --   },
    --   config = function()
    --     require "quarto".setup {
    --       lspFeatures = {
    --         enabled = true,
    --         languages = {"r", "python", "julia"},
    --         diagnostics = {
    --           enabled = true,
    --           triggers = {"BufWrite"}
    --         },
    --         completion = {
    --           enabled = true
    --         }
    --       }
    --     }
    --   end
    -- },
    -- Formatter
    {
      "mhartington/formatter.nvim",
      config = function()
        require("conf.formatter")
      end
    },
    -- Auto header completion
    --,{
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
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("nvim-autopairs").setup(
          {
            disable_filetype = {"TelescopePrompt", "vim"}
          }
        )
      end
    },
    {
      "hrsh7th/nvim-cmp",
      event = {"InsertEnter", "CmdlineEnter"},
      config = function()
        require("conf.complete")
      end
    },
    {
      "hrsh7th/cmp-path",
      dependencies = {
        "hrsh7th/nvim-cmp"
      }
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        "hrsh7th/nvim-cmp"
      }
    },
    {
      "hrsh7th/cmp-buffer",
      dependencies = {
        "hrsh7th/nvim-cmp"
      }
    },
    {
      "hrsh7th/cmp-vsnip",
      dependencies = {
        "hrsh7th/nvim-cmp"
      }
    },
    {
      "hrsh7th/vim-vsnip",
      dependencies = {
        "hrsh7th/nvim-cmp"
      },
      config = function()
        vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets/"
      end
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = {"VimEnter"},
      config = function()
        require("copilot").setup({})
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {
        "hrsh7th/nvim-cmp",
        "zbirenbaum/copilot.lua"
      },
      config = function()
        require("copilot_cmp").setup()
      end
    },
    -- Translator
    {
      "voldikss/vim-translator",
      config = function()
        vim.g.translator_history_enable = true
        vim.g.translator_default_engines = {"bing", "haici", "youdao"}
      end
    }
  }
)

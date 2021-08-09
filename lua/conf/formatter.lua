local function prettier_formatter()
  -- support flow|babel|babel-flow|babel-ts|typescript|css|less|scss|json|json5|json-stringify|graphql|markdown|mdx|vue|yaml|html|angular|lwc>
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      json = {
        -- prettier
        prettier_formatter
      },
      yaml = {
        -- prettier
        prettier_formatter
      },
      markdown = {
        -- prettier
        prettier_formatter
      },
      typescriptreact = {
        -- prettier
        prettier_formatter
      },
      javascript = {
        -- prettier
        prettier_formatter
      },
      typescript = {
        -- prettier
        prettier_formatter
      },
      html = {
        -- prettier
        prettier_formatter
      },
      css = {
        -- prettier
        prettier_formatter
      },
      sh = {
        -- shfmt
        -- GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
        function()
          return {exe = "shfmt", args = {"-i", 2}, stdin = true}
        end
      },
      python = {
        -- isort
        function()
          return {
            exe = "isort",
            args = {"-"},
            stdin = true
          }
        end,
        -- docformatter
        function()
          return {
            exe = "docformatter",
            args = {"-"},
            stdin = true
          }
        end,
        -- black
        function()
          return {
            exe = "black",
            args = {"-l", 79, "-"},
            stdin = true
          }
        end
      },
      snakemake = {
        -- snakefmt
        function()
          return {
            exe = "snakefmt",
            args = {"-"},
            stdin = true
          }
        end
      },
      r = {
        -- styler
        function()
          return {
            exe = "R",
            args = {
              "--slave",
              "--no-restore",
              "--no-save",
              "-e",
              '\'con <- file("stdin"); styler::style_text(readLines(con)); close(con)\'',
              "2>/dev/null"
            },
            stdin = true
          }
        end
      },
      perl = {
        -- perltidy
        function()
          return {
            exe = "perltidy",
            args = {
              "-st",
              "2>/dev/null"
            },
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        -- npm install lua-fmt -g
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      rust = {
        -- rustfmt-nightly
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      go = {
        -- gofmt
        function()
          return {
            exe = "gofmt",
            stdin = true
          }
        end
      }
    }
  }
)

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
          return {exe = "shfmt", args = {}, stdin = true}
        end
      },
      python = {
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
              "con<-file('stdin');out<-styler::style_text(readLines(con));close(con);print(out)",
              "2>/dev/null"
            },
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

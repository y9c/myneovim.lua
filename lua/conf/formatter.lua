require("formatter").setup(
  {
    logging = false,
    filetype = {
      typescriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      yaml = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
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

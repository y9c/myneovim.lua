local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command("augroup END")
  end
end

function autocmd.load_autocmds()
  local definitions = {
    bufs = {
      -- Reload vim config automatically
      {"BufWritePost", [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]},
      -- Reload Vim script automatically if setlocal autoread
      {
        "BufWritePost,FileWritePost",
        "*.vim",
        [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]
      },
      {"BufWritePre", "/tmp/*", "setlocal noundofile"},
      {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
      {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
      {"BufWritePre", "*.tmp", "setlocal noundofile"},
      {"BufWritePre", "*.bak", "setlocal noundofile"}
      -- Format before write buffer
      -- {"BufWritePre", "*.tsx", "lua vim.api.nvim_command('Format')"},
    },
    wins = {
      -- Highlight current line only on focused window
      {
        "WinEnter,BufEnter,InsertLeave",
        "*",
        [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]
      },
      {
        "WinLeave,BufLeave,InsertEnter",
        "*",
        [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]]
      },
      -- Equalize window dimensions when resizing vim window
      {"VimResized", "*", [[tabdo wincmd =]]},
      -- Force write shada on leaving nvim
      {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]},
      -- Check if file changed when its window is focus, more eager than 'autoread'
      {"FocusGained", "* checktime"}
    },
    ft = {
      {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"},
      {"BufNewFile,BufRead", "*.toml", " setf toml"},
      {"BufNewFile,BufRead", "*.jl", " setf julia"},
      {"BufNewFile,BufRead", "*.ipynb", " setf ipynb"},
      {"BufNewFile,BufRead", "Snakefile,*.smk", " setf snakemake"},
      {"BufNewFile,BufRead", "*.sbatch,*.sbatch.sh", " setf sbatch"}
    },
    yank = {
      {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]}
    },
    ["vimrc-remember-cursor-position"] = {
      {"BufReadPost", [[* if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]}
    },
    -- auto close quickfix
    ["autoclose-quickfix"] = {
      {"WinEnter", "*", [[if winnr('$') == 1 && &buftype == "quickfix"|q|endif]]}
    },
    ["plugin-cursorword"] = {
      {"FileType", "defx,denite,fern,clap,vista,packer,NvimTree", "let b:cursorword = 0"},
      {"WinEnter", "*", "if &diff || &pvw | let b:cursorword = 0 | endif"},
      {"InsertEnter", "*", "let b:cursorword = 0"},
      {"InsertLeave", "*", "let b:cursorword = 1"}
    }
  }

  autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()

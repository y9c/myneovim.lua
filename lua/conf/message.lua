local function show_message_floating()
  -- get dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- calculate our floating window size
  local win_height = math.ceil(height * 0.8)
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) * 0.4)
  local col = math.ceil((width - win_width) * 0.5)

  -- set some options
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }

  local contents = vim.split(vim.fn.execute("message"), "\n")
  contents = vim.lsp.util._trim_and_pad(contents, {pad_left = 1, pad_right = 1})

  require "lspsaga.window".open_shadow_float_win(
    {
      contents = contents,
      enter = true
    },
    opts
  )
end

return {show_message_floating = show_message_floating}

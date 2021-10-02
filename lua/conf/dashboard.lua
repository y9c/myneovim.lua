local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
  "",
  "       ▓██   ██▓▓█████  ▄████▄",
  "        ▒██  ██▒▓█   ▀ ▒██▀ ▀█",
  "         ▒██ ██░▒███   ▒▓█    ▄",
  "         ░ ▐██▓░▒▓█  ▄ ▒▓▓▄ ▄██▒",
  "         ░ ██▒▓░░▒████▒▒ ▓███▀ ░",
  "          ██▒▒▒ ░░ ▒░ ░░ ░▒ ▒  ░",
  "        ▓██ ░▒░  ░ ░  ░  ░  ▒",
  "        ▒ ▒ ░░     ░   ░",
  "        ░ ░        ░  ░░ ░",
  "        ░ ░            ░",
  ""
}

dashboard.section.buttons.val = {
  dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find File", ":Telescope find_files find_command=rg,--hidden,--files,--glob,!.git<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>")
}

-- make the opt run
alpha.setup(dashboard.opts)

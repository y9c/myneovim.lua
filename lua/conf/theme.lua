-- Config copy from: https://github.com/glepnir/zephyr-nvim
-- Color copy from: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua

local color_palettes = {
  zephyr = {
    base0 = "#1B2229",
    base1 = "#1c1f24",
    base2 = "#202328",
    base3 = "#23272e",
    base4 = "#3f444a",
    base5 = "#5B6268",
    base6 = "#73797e",
    base7 = "#9ca0a4",
    base8 = "#b1b1b1",
    bg = "#262a33",
    bg1 = "#504945",
    bg_popup = "#3E4556",
    bg_highlight = "#2E323C",
    bg_visual = "#b3deef",
    fg = "#bbc2cf",
    fg_alt = "#5B6268",
    red = "#e95678",
    redwine = "#d16d9e",
    orange = "#FF8700",
    yellow = "#f7bb3b",
    lignt_orange = "#fab795",
    green = "#afd700",
    dark_green = "#98be65",
    cyan = "#36d0e0",
    blue = "#61afef",
    violet = "#CBA6F7",
    magenta = "#c678dd",
    teal = "#1abc9c",
    grey = "#928374",
    brown = "#c78665",
    black = "#000000",
    bracket = "#80A0C2",
    none = "NONE"
  },
  mocha = {
    base0 = "#1B2229",
    base1 = "#1c1f24",
    base2 = "#202328",
    base3 = "#23272e",
    base4 = "#3f444a",
    base5 = "#5B6268",
    base6 = "#73797e",
    base7 = "#9ca0a4",
    base8 = "#b1b1b1",
    bg = "#262a33",
    bg1 = "#504945",
    bg_popup = "#3E4556",
    bg_highlight = "#2E323C",
    bg_visual = "#b3deef",
    fg = "#bbc2cf",
    fg_alt = "#5B6268",
    red = "#e95678",
    redwine = "#d16d9e",
    orange = "#FF8700",
    yellow = "#f7bb3b",
    lignt_orange = "#FAB387",
    green = "#A6E3A1",
    dark_green = "#037171",
    cyan = "#74C7EC",
    blue = "#89B4FA",
    violet = "#CBA6F7",
    magenta = "#c678dd",
    teal = "#94E2D5",
    grey = "#CDD6F4",
    brown = "#EBA0AC",
    black = "#1E1E2E",
    bracket = "#7F849C",
    none = "NONE"
  }
}

local cs = color_palettes.mocha

function cs.terminal_color()
  vim.g.terminal_color_0 = cs.bg
  vim.g.terminal_color_1 = cs.red
  vim.g.terminal_color_2 = cs.green
  vim.g.terminal_color_3 = cs.yellow
  vim.g.terminal_color_4 = cs.blue
  vim.g.terminal_color_5 = cs.violet
  vim.g.terminal_color_6 = cs.cyan
  vim.g.terminal_color_7 = cs.bg1
  vim.g.terminal_color_8 = cs.brown
  vim.g.terminal_color_9 = cs.red
  vim.g.terminal_color_10 = cs.green
  vim.g.terminal_color_11 = cs.yellow
  vim.g.terminal_color_12 = cs.blue
  vim.g.terminal_color_13 = cs.violet
  vim.g.terminal_color_14 = cs.cyan
  vim.g.terminal_color_15 = cs.fg
end

local syntax = {
  Normal = {fg = cs.fg, bg = cs.bg},
  Terminal = {fg = cs.fg, bg = cs.bg},
  SignColumn = {fg = cs.fg, bg = cs.bg},
  FoldColumn = {fg = cs.fg_alt, bg = cs.black},
  VertSplit = {fg = cs.black, bg = cs.bg},
  Folded = {fg = cs.lignt_orange, bg = cs.bg_highlight},
  EndOfBuffer = {fg = cs.bg, bg = cs.none},
  IncSearch = {fg = cs.bg1, bg = cs.orange},
  Search = {fg = cs.bg, bg = cs.orange},
  ColorColumn = {bg = cs.bg_highlight},
  Conceal = {fg = cs.grey, bg = cs.none},
  Cursor = {bg = cs.none, reverse = true},
  vCursor = {bg = cs.none, reverse = true},
  iCursor = {bg = cs.none, reverse = true},
  lCursor = {bg = cs.none, reverse = true},
  CursorIM = {bg = cs.none, reverse = true},
  CursorColumn = {bg = cs.bg_highlight},
  CursorLine = {bg = cs.bg_highlight},
  LineNr = {fg = cs.base4},
  qfLineNr = {fg = cs.cyan},
  CursorLineNr = {fg = cs.blue},
  DiffAdd = {fg = cs.black, bg = cs.dark_green},
  DiffChange = {fg = cs.black, bg = cs.yellow},
  DiffDelete = {fg = cs.black, bg = cs.red},
  DiffText = {fg = cs.black, bg = cs.fg},
  Directory = {fg = cs.blue, bg = cs.none},
  ErrorMsg = {fg = cs.red, bg = cs.none, bold = true},
  WarningMsg = {fg = cs.yellow, bg = cs.none, bold = true},
  ModeMsg = {fg = cs.fg, bg = cs.none, bold = true},
  MatchParen = {fg = cs.red, bg = cs.none},
  NonText = {fg = cs.bg1},
  Whitespace = {fg = cs.base4},
  SpecialKey = {fg = cs.bg1},
  Pmenu = {fg = cs.fg, bg = cs.bg_popup},
  PmenuSel = {fg = cs.base0, bg = cs.blue},
  PmenuSelBold = {fg = cs.base0, bg = cs.blue},
  PmenuSbar = {bg = cs.base4},
  PmenuThumb = {fg = cs.violet, bg = cs.light_green},
  WildMenu = {fg = cs.bg1, bg = cs.green},
  StatusLine = {fg = cs.base8, bg = cs.base2},
  StatusLineNC = {fg = cs.grey, bg = cs.base2},
  Question = {fg = cs.yellow},
  NormalFloat = {fg = cs.base8, bg = cs.bg_highlight},
  Tabline = {fg = cs.base6, bg = cs.base2},
  TabLineSel = {fg = cs.fg, bg = cs.blue},
  SpellBad = {fg = cs.red, bg = cs.none, undercurl = true},
  SpellCap = {fg = cs.blue, bg = cs.none, undercurl = true},
  SpellLocal = {fg = cs.cyan, bg = cs.none, undercurl = true},
  SpellRare = {fg = cs.violet, bg = cs.none, undercurl = true},
  Visual = {fg = cs.black, bg = cs.bg_visual},
  VisualNOS = {fg = cs.black, bg = cs.bg_visual},
  QuickFixLine = {fg = cs.violet, bold = true},
  Debug = {fg = cs.orange},
  debugBreakpoint = {fg = cs.bg, bg = cs.red},
  Boolean = {fg = cs.orange},
  Number = {fg = cs.brown},
  Float = {fg = cs.brown},
  PreProc = {fg = cs.violet},
  PreCondit = {fg = cs.violet},
  Include = {fg = cs.violet},
  Define = {fg = cs.violet},
  Conditional = {fg = cs.magenta},
  Repeat = {fg = cs.magenta},
  Keyword = {fg = cs.green},
  Typedef = {fg = cs.red},
  Exception = {fg = cs.red},
  Statement = {fg = cs.red},
  Error = {fg = cs.red},
  StorageClass = {fg = cs.orange},
  Tag = {fg = cs.orange},
  Label = {fg = cs.orange},
  Structure = {fg = cs.orange},
  Operator = {fg = cs.redwine},
  Title = {fg = cs.orange, bold = true},
  Special = {fg = cs.yellow},
  SpecialChar = {fg = cs.yellow},
  Type = {fg = cs.teal},
  Function = {fg = cs.yellow},
  String = {fg = cs.lignt_orange},
  Character = {fg = cs.green},
  Constant = {fg = cs.cyan},
  Macro = {fg = cs.cyan},
  Identifier = {fg = cs.blue},
  Comment = {fg = cs.base6, italic = true},
  SpecialComment = {fg = cs.grey},
  Todo = {fg = cs.violet},
  Delimiter = {fg = cs.fg},
  Ignore = {fg = cs.grey},
  Underlined = {underline = true},
  DashboardShortCut = {fg = cs.magenta},
  DashboardHeader = {fg = cs.orange},
  DashboardCenter = {fg = cs.teal},
  DashboardCenterIcon = {fg = cs.blue},
  DashboardFooter = {fg = cs.yellow, bold = true}
}

local plugin_syntax = {
  TSFunction = {fg = cs.cyan},
  TSMethod = {fg = cs.cyan},
  TSKeywordFunction = {fg = cs.red},
  TSProperty = {fg = cs.yellow},
  TSType = {fg = cs.teal},
  TSVariable = {fg = "#f2f2bf"},
  TSPunctBracket = {fg = cs.bracket},
  vimCommentTitle = {fg = cs.grey, bold = true},
  vimLet = {fg = cs.orange},
  vimVar = {fg = cs.cyan},
  vimFunction = {fg = cs.redwine},
  vimIsCommand = {fg = cs.fg},
  vimCommand = {fg = cs.blue},
  vimNotFunc = {fg = cs.violet, bold = true},
  vimUserFunc = {fg = cs.yellow, bold = true},
  vimFuncName = {fg = cs.yellow, bold = true},
  diffAdded = {fg = cs.dark_green},
  diffRemoved = {fg = cs.red},
  diffChanged = {fg = cs.blue},
  diffOldFile = {fg = cs.yellow},
  diffNewFile = {fg = cs.orange},
  diffFile = {fg = cs.cyan},
  diffLine = {fg = cs.grey},
  diffIndexLine = {fg = cs.violet},
  gitcommitSummary = {fg = cs.red},
  gitcommitUntracked = {fg = cs.grey},
  gitcommitDiscarded = {fg = cs.grey},
  gitcommitSelected = {fg = cs.grey},
  gitcommitUnmerged = {fg = cs.grey},
  gitcommitOnBranch = {fg = cs.grey},
  gitcommitArrow = {fg = cs.grey},
  gitcommitFile = {fg = cs.dark_green},
  VistaBracket = {fg = cs.grey},
  VistaChildrenNr = {fg = cs.orange},
  VistaKind = {fg = cs.violet},
  VistaScope = {fg = cs.red},
  VistaScopeKind = {fg = cs.blue},
  VistaTag = {fg = cs.magenta, bold = true},
  VistaPrefix = {fg = cs.grey},
  VistaColon = {fg = cs.magenta},
  VistaIcon = {fg = cs.yellow},
  VistaLineNr = {fg = cs.fg},
  GitGutterAdd = {fg = cs.dark_green},
  GitGutterChange = {fg = cs.blue},
  GitGutterDelete = {fg = cs.red},
  GitGutterChangeDelete = {fg = cs.violet},
  GitSignsAdd = {fg = cs.dark_green},
  GitSignsChange = {fg = cs.blue},
  GitSignsDelete = {fg = cs.red},
  GitSignsAddNr = {fg = cs.dark_green},
  GitSignsChangeNr = {fg = cs.blue},
  GitSignsDeleteNr = {fg = cs.red},
  GitSignsAddLn = {bg = cs.bg_popup},
  GitSignsChangeLn = {bg = cs.bg_highlight},
  GitSignsDeleteLn = {bg = cs.bg1},
  SignifySignAdd = {fg = cs.dark_green},
  SignifySignChange = {fg = cs.blue},
  SignifySignDelete = {fg = cs.red},
  dbui_tables = {fg = cs.blue},
  CursorWord = {bg = cs.base4, underline = true},
  NvimTreeFolderName = {fg = cs.blue},
  NvimTreeRootFolder = {fg = cs.red, bold = true},
  NvimTreeSpecialFile = {fg = cs.fg, bg = cs.none},
  NvimTreeGitDirty = {fg = cs.redwine},
  TelescopeBorder = {fg = cs.teal},
  TelescopePromptBorder = {fg = cs.blue},
  TelescopeMatching = {fg = cs.teal},
  TelescopeSelection = {fg = cs.yellow, bg = cs.bg_highlight, bold = true},
  TelescopeSelectionCaret = {fg = cs.yellow},
  TelescopeMultiSelection = {fg = cs.teal},
  -- nvim v0.6.0+
  DiagnosticSignError = {fg = cs.red},
  DiagnosticSignWarn = {fg = cs.yellow},
  DiagnosticSignInfo = {fg = cs.blue},
  DiagnosticSignHint = {fg = cs.cyan},
  DiagnosticError = {fg = cs.red},
  DiagnosticWarn = {fg = cs.yellow},
  DiagnosticInfo = {fg = cs.blue},
  DiagnosticHint = {fg = cs.cyan},
  LspReferenceRead = {bg = cs.bg_highlight, bold = true},
  LspReferenceText = {bg = cs.bg_highlight, bold = true},
  LspReferenceWrite = {bg = cs.bg_highlight, bold = true},
  DiagnosticVirtualTextError = {fg = cs.red},
  DiagnosticVirtualTextWarn = {fg = cs.yellow},
  DiagnosticVirtualTextInfo = {fg = cs.blue},
  DiagnosticVirtualTextHint = {fg = cs.cyan},
  DiagnosticUnderlineError = {undercurl = true, sp = cs.red},
  DiagnosticUnderlineWarn = {undercurl = true, sp = cs.yellow},
  DiagnosticUnderlineInfo = {undercurl = true, sp = cs.blue},
  DiagnosticUnderlineHint = {undercurl = true, sp = cs.cyan},
  -- nvim-cmp
  CmpItemAbbr = {fg = cs.fg},
  CmpItemAbbrMatch = {fg = "#A6E22E"},
  CmpItemMenu = {fg = cs.base5, italic = true},
  CmpItemKindVariable = {fg = cs.blue},
  CmpItemKindFiled = {fg = cs.magenta},
  CmpItemKindFunction = {fg = cs.yellow},
  CmpItemKindClass = {fg = cs.orange},
  CmpItemKindMethod = {fg = cs.teal},
  CmpItemKindKeyWord = {fg = cs.red},
  CmpItemKindText = {fg = cs.light_green},
  CmpItemKindModule = {fg = cs.cyan},
  -- Neogit
  NeogitDiffAddHighlight = {fg = cs.green},
  NeogitDiffDeleteHighlight = {fg = cs.red},
  NeogitDiffContextHighlight = {fg = cs.blue},
  NeogitHunkHeader = {fg = cs.fg},
  NeogitHunkHeaderHighlight = {fg = cs.redwine}
}

local async_load_plugin

local set_hl = function(tbl)
  for group, conf in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, conf)
  end
end

async_load_plugin =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      cs.terminal_color()
      set_hl(plugin_syntax)
      async_load_plugin:close()
    end
  )
)

function cs.colorscheme()
  vim.api.nvim_command("hi clear")

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "zephyr"
  set_hl(syntax)
  async_load_plugin:send()
end

cs.colorscheme()

return cs

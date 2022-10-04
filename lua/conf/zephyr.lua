local zephyr = {
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
  -- #a8eb44
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
}

function zephyr.terminal_color()
  vim.g.terminal_color_0 = zephyr.bg
  vim.g.terminal_color_1 = zephyr.red
  vim.g.terminal_color_2 = zephyr.green
  vim.g.terminal_color_3 = zephyr.yellow
  vim.g.terminal_color_4 = zephyr.blue
  vim.g.terminal_color_5 = zephyr.violet
  vim.g.terminal_color_6 = zephyr.cyan
  vim.g.terminal_color_7 = zephyr.bg1
  vim.g.terminal_color_8 = zephyr.brown
  vim.g.terminal_color_9 = zephyr.red
  vim.g.terminal_color_10 = zephyr.green
  vim.g.terminal_color_11 = zephyr.yellow
  vim.g.terminal_color_12 = zephyr.blue
  vim.g.terminal_color_13 = zephyr.violet
  vim.g.terminal_color_14 = zephyr.cyan
  vim.g.terminal_color_15 = zephyr.fg
end

local syntax = {
  Normal = {fg = zephyr.fg, bg = zephyr.bg},
  Terminal = {fg = zephyr.fg, bg = zephyr.bg},
  SignColumn = {fg = zephyr.fg, bg = zephyr.bg},
  FoldColumn = {fg = zephyr.fg_alt, bg = zephyr.black},
  VertSplit = {fg = zephyr.black, bg = zephyr.bg},
  Folded = {fg = zephyr.lignt_orange, bg = zephyr.bg_highlight},
  EndOfBuffer = {fg = zephyr.bg, bg = zephyr.none},
  IncSearch = {fg = zephyr.bg1, bg = zephyr.orange},
  Search = {fg = zephyr.bg, bg = zephyr.orange},
  ColorColumn = {bg = zephyr.bg_highlight},
  Conceal = {fg = zephyr.grey, bg = zephyr.none},
  Cursor = {bg = zephyr.none, reverse = true},
  vCursor = {bg = zephyr.none, reverse = true},
  iCursor = {bg = zephyr.none, reverse = true},
  lCursor = {bg = zephyr.none, reverse = true},
  CursorIM = {bg = zephyr.none, reverse = true},
  CursorColumn = {bg = zephyr.bg_highlight},
  CursorLine = {bg = zephyr.bg_highlight},
  LineNr = {fg = zephyr.base4},
  qfLineNr = {fg = zephyr.cyan},
  CursorLineNr = {fg = zephyr.blue},
  DiffAdd = {fg = zephyr.black, bg = zephyr.dark_green},
  DiffChange = {fg = zephyr.black, bg = zephyr.yellow},
  DiffDelete = {fg = zephyr.black, bg = zephyr.red},
  DiffText = {fg = zephyr.black, bg = zephyr.fg},
  Directory = {fg = zephyr.blue, bg = zephyr.none},
  ErrorMsg = {fg = zephyr.red, bg = zephyr.none, bold = true},
  WarningMsg = {fg = zephyr.yellow, bg = zephyr.none, bold = true},
  ModeMsg = {fg = zephyr.fg, bg = zephyr.none, bold = true},
  MatchParen = {fg = zephyr.red, bg = zephyr.none},
  NonText = {fg = zephyr.bg1},
  Whitespace = {fg = zephyr.base4},
  SpecialKey = {fg = zephyr.bg1},
  Pmenu = {fg = zephyr.fg, bg = zephyr.bg_popup},
  PmenuSel = {fg = zephyr.base0, bg = zephyr.blue},
  PmenuSelBold = {fg = zephyr.base0, bg = zephyr.blue},
  PmenuSbar = {bg = zephyr.base4},
  PmenuThumb = {fg = zephyr.violet, bg = zephyr.light_green},
  WildMenu = {fg = zephyr.bg1, bg = zephyr.green},
  StatusLine = {fg = zephyr.base8, bg = zephyr.base2},
  StatusLineNC = {fg = zephyr.grey, bg = zephyr.base2},
  Question = {fg = zephyr.yellow},
  NormalFloat = {fg = zephyr.base8, bg = zephyr.bg_highlight},
  Tabline = {fg = zephyr.base6, bg = zephyr.base2},
  TabLineSel = {fg = zephyr.fg, bg = zephyr.blue},
  SpellBad = {fg = zephyr.red, bg = zephyr.none, undercurl = true},
  SpellCap = {fg = zephyr.blue, bg = zephyr.none, undercurl = true},
  SpellLocal = {fg = zephyr.cyan, bg = zephyr.none, undercurl = true},
  SpellRare = {fg = zephyr.violet, bg = zephyr.none, undercurl = true},
  Visual = {fg = zephyr.black, bg = zephyr.bg_visual},
  VisualNOS = {fg = zephyr.black, bg = zephyr.bg_visual},
  QuickFixLine = {fg = zephyr.violet, bold = true},
  Debug = {fg = zephyr.orange},
  debugBreakpoint = {fg = zephyr.bg, bg = zephyr.red},
  Boolean = {fg = zephyr.orange},
  Number = {fg = zephyr.brown},
  Float = {fg = zephyr.brown},
  PreProc = {fg = zephyr.violet},
  PreCondit = {fg = zephyr.violet},
  Include = {fg = zephyr.violet},
  Define = {fg = zephyr.violet},
  Conditional = {fg = zephyr.magenta},
  Repeat = {fg = zephyr.magenta},
  Keyword = {fg = zephyr.green},
  Typedef = {fg = zephyr.red},
  Exception = {fg = zephyr.red},
  Statement = {fg = zephyr.red},
  Error = {fg = zephyr.red},
  StorageClass = {fg = zephyr.orange},
  Tag = {fg = zephyr.orange},
  Label = {fg = zephyr.orange},
  Structure = {fg = zephyr.orange},
  Operator = {fg = zephyr.redwine},
  Title = {fg = zephyr.orange, bold = true},
  Special = {fg = zephyr.yellow},
  SpecialChar = {fg = zephyr.yellow},
  Type = {fg = zephyr.teal},
  Function = {fg = zephyr.yellow},
  String = {fg = zephyr.lignt_orange},
  Character = {fg = zephyr.green},
  Constant = {fg = zephyr.cyan},
  Macro = {fg = zephyr.cyan},
  Identifier = {fg = zephyr.blue},
  Comment = {fg = zephyr.base6, italic = true},
  SpecialComment = {fg = zephyr.grey},
  Todo = {fg = zephyr.violet},
  Delimiter = {fg = zephyr.fg},
  Ignore = {fg = zephyr.grey},
  Underlined = {underline = true},
  DashboardShortCut = {fg = zephyr.magenta},
  DashboardHeader = {fg = zephyr.orange},
  DashboardCenter = {fg = zephyr.teal},
  DashboardCenterIcon = {fg = zephyr.blue},
  DashboardFooter = {fg = zephyr.yellow, bold = true}
}

local plugin_syntax = {
  TSFunction = {fg = zephyr.cyan},
  TSMethod = {fg = zephyr.cyan},
  TSKeywordFunction = {fg = zephyr.red},
  TSProperty = {fg = zephyr.yellow},
  TSType = {fg = zephyr.teal},
  TSVariable = {fg = "#f2f2bf"},
  TSPunctBracket = {fg = zephyr.bracket},
  vimCommentTitle = {fg = zephyr.grey, bold = true},
  vimLet = {fg = zephyr.orange},
  vimVar = {fg = zephyr.cyan},
  vimFunction = {fg = zephyr.redwine},
  vimIsCommand = {fg = zephyr.fg},
  vimCommand = {fg = zephyr.blue},
  vimNotFunc = {fg = zephyr.violet, bold = true},
  vimUserFunc = {fg = zephyr.yellow, bold = true},
  vimFuncName = {fg = zephyr.yellow, bold = true},
  diffAdded = {fg = zephyr.dark_green},
  diffRemoved = {fg = zephyr.red},
  diffChanged = {fg = zephyr.blue},
  diffOldFile = {fg = zephyr.yellow},
  diffNewFile = {fg = zephyr.orange},
  diffFile = {fg = zephyr.cyan},
  diffLine = {fg = zephyr.grey},
  diffIndexLine = {fg = zephyr.violet},
  gitcommitSummary = {fg = zephyr.red},
  gitcommitUntracked = {fg = zephyr.grey},
  gitcommitDiscarded = {fg = zephyr.grey},
  gitcommitSelected = {fg = zephyr.grey},
  gitcommitUnmerged = {fg = zephyr.grey},
  gitcommitOnBranch = {fg = zephyr.grey},
  gitcommitArrow = {fg = zephyr.grey},
  gitcommitFile = {fg = zephyr.dark_green},
  VistaBracket = {fg = zephyr.grey},
  VistaChildrenNr = {fg = zephyr.orange},
  VistaKind = {fg = zephyr.violet},
  VistaScope = {fg = zephyr.red},
  VistaScopeKind = {fg = zephyr.blue},
  VistaTag = {fg = zephyr.magenta, bold = true},
  VistaPrefix = {fg = zephyr.grey},
  VistaColon = {fg = zephyr.magenta},
  VistaIcon = {fg = zephyr.yellow},
  VistaLineNr = {fg = zephyr.fg},
  GitGutterAdd = {fg = zephyr.dark_green},
  GitGutterChange = {fg = zephyr.blue},
  GitGutterDelete = {fg = zephyr.red},
  GitGutterChangeDelete = {fg = zephyr.violet},
  GitSignsAdd = {fg = zephyr.dark_green},
  GitSignsChange = {fg = zephyr.blue},
  GitSignsDelete = {fg = zephyr.red},
  GitSignsAddNr = {fg = zephyr.dark_green},
  GitSignsChangeNr = {fg = zephyr.blue},
  GitSignsDeleteNr = {fg = zephyr.red},
  GitSignsAddLn = {bg = zephyr.bg_popup},
  GitSignsChangeLn = {bg = zephyr.bg_highlight},
  GitSignsDeleteLn = {bg = zephyr.bg1},
  SignifySignAdd = {fg = zephyr.dark_green},
  SignifySignChange = {fg = zephyr.blue},
  SignifySignDelete = {fg = zephyr.red},
  dbui_tables = {fg = zephyr.blue},
  CursorWord = {bg = zephyr.base4, underline = true},
  NvimTreeFolderName = {fg = zephyr.blue},
  NvimTreeRootFolder = {fg = zephyr.red, bold = true},
  NvimTreeSpecialFile = {fg = zephyr.fg, bg = zephyr.none},
  NvimTreeGitDirty = {fg = zephyr.redwine},
  TelescopeBorder = {fg = zephyr.teal},
  TelescopePromptBorder = {fg = zephyr.blue},
  TelescopeMatching = {fg = zephyr.teal},
  TelescopeSelection = {fg = zephyr.yellow, bg = zephyr.bg_highlight, bold = true},
  TelescopeSelectionCaret = {fg = zephyr.yellow},
  TelescopeMultiSelection = {fg = zephyr.teal},
  -- nvim v0.6.0+
  DiagnosticSignError = {fg = zephyr.red},
  DiagnosticSignWarn = {fg = zephyr.yellow},
  DiagnosticSignInfo = {fg = zephyr.blue},
  DiagnosticSignHint = {fg = zephyr.cyan},
  DiagnosticError = {fg = zephyr.red},
  DiagnosticWarn = {fg = zephyr.yellow},
  DiagnosticInfo = {fg = zephyr.blue},
  DiagnosticHint = {fg = zephyr.cyan},
  LspReferenceRead = {bg = zephyr.bg_highlight, bold = true},
  LspReferenceText = {bg = zephyr.bg_highlight, bold = true},
  LspReferenceWrite = {bg = zephyr.bg_highlight, bold = true},
  DiagnosticVirtualTextError = {fg = zephyr.red},
  DiagnosticVirtualTextWarn = {fg = zephyr.yellow},
  DiagnosticVirtualTextInfo = {fg = zephyr.blue},
  DiagnosticVirtualTextHint = {fg = zephyr.cyan},
  DiagnosticUnderlineError = {undercurl = true, sp = zephyr.red},
  DiagnosticUnderlineWarn = {undercurl = true, sp = zephyr.yellow},
  DiagnosticUnderlineInfo = {undercurl = true, sp = zephyr.blue},
  DiagnosticUnderlineHint = {undercurl = true, sp = zephyr.cyan},
  -- nvim-cmp
  CmpItemAbbr = {fg = zephyr.fg},
  CmpItemAbbrMatch = {fg = "#A6E22E"},
  CmpItemMenu = {fg = zephyr.base5, italic = true},
  CmpItemKindVariable = {fg = zephyr.blue},
  CmpItemKindFiled = {fg = zephyr.magenta},
  CmpItemKindFunction = {fg = zephyr.yellow},
  CmpItemKindClass = {fg = zephyr.orange},
  CmpItemKindMethod = {fg = zephyr.teal},
  CmpItemKindKeyWord = {fg = zephyr.red},
  CmpItemKindText = {fg = zephyr.light_green},
  CmpItemKindModule = {fg = zephyr.cyan},
  -- Neogit
  NeogitDiffAddHighlight = {fg = zephyr.green},
  NeogitDiffDeleteHighlight = {fg = zephyr.red},
  NeogitDiffContextHighlight = {fg = zephyr.blue},
  NeogitHunkHeader = {fg = zephyr.fg},
  NeogitHunkHeaderHighlight = {fg = zephyr.redwine}
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
      zephyr.terminal_color()
      set_hl(plugin_syntax)
      async_load_plugin:close()
    end
  )
)

function zephyr.colorscheme()
  vim.api.nvim_command("hi clear")

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "zephyr"
  set_hl(syntax)
  async_load_plugin:send()
end

zephyr.colorscheme()

return zephyr

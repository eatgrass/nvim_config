local M = {}

local utils = require "custom.hl_utils"
local colors = utils.colors
local groups = utils.groups

local function lighten(type, color, percentage)
  local c = type[color]
  if not c then
    print("color: " .. color .. "undefined")
  else
    return utils.change_hex_lightness(c, percentage)
  end
end

local nvim_tree_panel_bg = lighten(groups, "background", 0)
local git_change_bg = utils.blend(groups["git_change"], groups["background"], 0.4)
local git_delete_bg = utils.blend(groups["git_delete"], groups["background"], 0.2)
local git_add_bg = utils.blend(groups["git_add"], groups["background"], 0.3)

local hl_groups = {
  ColorColumn = { bg = colors["bluegray1"] },
  Conceal = { bg = "NONE" },
  CursorColumn = { bg = colors["background1"] },
  -- CursorLine = { bg = colors["background1"] },
  CursorLine = { ctermfg = "white", bg = colors["background1"] }, -- ctermfg is a workaround https://github.com/neovim/neovim/issues/9800
  CursorLineNr = { fg = colors["text"] },
  DarkenedPanel = { bg = groups["panel"] },
  DarkenedStatusline = { bg = groups["panel"] },

  Search = { bg = lighten(colors, "blue3", -15), bold = true, nocombine = true },
  IncSearch = {
    fg = colors["background3"],
    bg = colors["blue2"],
    bold = true,
    underdotted = true,
    sp = colors["background3"],
  },
  CurSearch = { link = "IncSearch" },
  Substitute = { link = "IncSearch" },
  Directory = { fg = colors["blue3"], bg = "NONE" },
  ErrorMsg = { fg = colors["pink3"], bold = true },
  FloatBorder = { fg = groups["border"] },
  FloatTitle = { fg = colors["bluegray2"] },
  FoldColumn = { link = "WinSeperator" },
  Folded = { fg = colors["bluegray3"], bg = utils.blend(groups["background"], colors["bluegray3"], 0.8), bold = true },
  LineNr = { fg = colors["bluegray3"] },
  MatchParen = { bg = colors["bluegray3"], fg = colors["background3"] },
  ModeMsg = { fg = colors["blue3"] },
  MoreMsg = { fg = colors["blue3"] },
  NonText = { fg = colors["blue4"] },
  Normal = { fg = colors["text"], bg = groups["background"] },
  NormalFloat = { fg = colors["text"], bg = groups["panel"] },
  NormalNC = { fg = colors["text"], bg = groups["background"] },
  NvimInternalError = { fg = colors["white"], bg = colors["pink3"] },
  Pmenu = { fg = colors["bluegray1"], bg = groups["panel"] },
  PmenuSbar = { bg = colors["bluegray2"] },
  PmenuSel = { fg = colors["text"], bg = "pmenu_bg" },
  PmenuThumb = { bg = colors["bluegray3"] },
  Question = { fg = colors["text"] },
  RedrawDebugClear = { fg = colors["white"], bg = colors["yellow"] },
  RedrawDebugComposed = { fg = colors["white"], bg = colors["teal2"] },
  RedrawDebugRecompose = { fg = colors["white"], bg = colors["pink3"] },
  SpecialKey = { fg = colors["teal1"] },
  SpellBad = { sp = colors["pink3"], undercurl = true },
  SpellCap = { sp = colors["blue1"], undercurl = true },
  SpellLocal = { sp = colors["yellow"], undercurl = true },
  SpellRare = { sp = colors["blue1"], undercurl = true },
  SignColumn = { fg = colors["text"], bg = "NONE" },
  StatusLine = { fg = colors["blue3"], bg = groups["panel"] },
  StatusLineNC = { fg = colors["blue3"], bg = groups["background"] },
  StatusLineTerm = { link = "StatusLine" },
  StatusLineTermNC = { link = "StatusLineNC" },
  TabLine = { fg = colors["blue3"], bg = groups["panel"] },
  TabLineFill = { bg = groups["panel"] },
  TabLineSel = { fg = colors["text"], bg = colors["background1"] },
  Title = { fg = colors["text"] },
  VertSplit = { fg = "NONE", bg = "NONE" },
  Visual = { fg = colors["text"], bg = colors["bluegray3"] },
  WarningMsg = { fg = colors["yellow"] },
  Whitespace = { fg = colors["bluegray3"] },
  WildMenu = { link = "IncSearch" },

  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },
  Error = { fg = colors["pink3"] },
  Todo = { bg = "NONE", fg = colors["blue1"], bold = true },
  qfLineNr = { fg = colors["bluegray3"] },
  qfFileName = { fg = colors["bluegray2"] },
  htmlH1 = { fg = colors["teal1"], bold = true },
  htmlH2 = { fg = colors["teal1"], bold = true },
  -- mkdCodeDelimiter = { bg = colors["background3"], fg = colors["text"] },
  -- mkdCodeStart = { fg = colors["teal2"], bold = true },
  -- mkdCodeEnd = { fg = colors["teal2"], bold = true },
  -- mkdLink = { fg = colors["blue1"], underline = true },
  -- markdownHeadingDelimiter = { fg = colors["blue4"], bold = true },
  -- markdownCode = { fg = colors["bluegray1"] },
  -- markdownCodeBlock = { fg = colors["teal2"] },
  -- markdownH1 = { fg = colors["blue2"], bold = true },
  -- markdownH2 = { fg = colors["blue2"], bold = true },
  -- markdownH3 = { fg = colors["blue2"], bold = true },
  -- markdownH4 = { fg = colors["blue2"], bold = true },
  -- markdownLinkText = { fg = colors["blue1"], underline = true },

  DiagnosticError = { fg = groups["error"] },
  DiagnosticHint = { fg = groups["hint"] },
  DiagnosticInfo = { fg = groups["info"] },
  DiagnosticWarn = { fg = groups["warn"] },
  DiagnosticDefaultError = { fg = groups["error"] },
  DiagnosticDefaultHint = { fg = groups["hint"] },
  DiagnosticDefaultInfo = { fg = groups["info"] },
  DiagnosticDefaultWarn = { fg = groups["warn"] },
  DiagnosticFloatingError = { fg = groups["error"] },
  DiagnosticFloatingHint = { fg = groups["hint"] },
  DiagnosticFloatingInfo = { fg = groups["info"] },
  DiagnosticFloatingWarn = { fg = groups["warn"] },
  DiagnosticSignError = { fg = groups["error"] },
  DiagnosticSignHint = { fg = groups["hint"] },
  DiagnosticSignInfo = { fg = groups["info"] },
  DiagnosticSignWarn = { fg = groups["warn"] },
  DiagnosticStatusLineError = { fg = groups["error"], bg = groups["panel"] },
  DiagnosticStatusLineHint = { fg = groups["hint"], bg = groups["panel"] },
  DiagnosticStatusLineInfo = { fg = groups["info"], bg = groups["panel"] },
  DiagnosticStatusLineWarn = { fg = groups["warn"], bg = groups["panel"] },
  DiagnosticUnderlineError = { sp = groups["error"], undercurl = true },
  DiagnosticUnderlineHint = { sp = groups["hint"], undercurl = true },
  DiagnosticUnderlineInfo = { sp = groups["info"], undercurl = true },
  DiagnosticUnderlineWarn = { sp = groups["warn"], undercurl = true },
  DiagnosticVirtualTextError = { fg = groups["error"] },
  DiagnosticVirtualTextHint = { fg = groups["hint"] },
  DiagnosticVirtualTextInfo = { fg = groups["info"] },
  DiagnosticVirtualTextWarn = { fg = groups["warn"] },

  Constant = { fg = colors["pink2"] },
  Variable = { fg = colors["bluegray1"] },
  String = { fg = colors["teal2"] },
  Character = { fg = colors["pink3"] },
  Number = { fg = colors["teal1"] },
  Boolean = { fg = colors["teal1"] },
  Float = { fg = colors["teal1"] },
  Identifier = { fg = colors["bluegray1"] },
  Function = { fg = colors["teal1"] },
  Statement = { fg = colors["text"] },
  Conditional = { fg = colors["bluegray1"] },
  Repeat = { fg = colors["blue3"] },
  Label = { fg = colors["text"] },
  Operator = { fg = colors["blue2"] },
  Keyword = { fg = lighten(colors, "pink3", -10) },
  Exception = { fg = colors["blue3"] },
  PreProc = { fg = colors["text"] },
  -- Include = { fg = colors["bluegray1"] },
  Include = { link = "Keyword" },
  Type = { fg = colors["text"] },
  Special = { fg = colors["bluegray2"] },
  -- Tag = { fg = colors["text"] },
  Tag = { link = "Keyword" },
  Delimiter = { fg = colors["bluegray1"] },
  SpecialComment = { fg = colors["bluegray1"] },
  Comment = { fg = colors["bluegray3"] },
  -- ["@variable"] = { fg = colors["text"] },
  ["@variable"] = { link = "Variable" },
  ["@boolean"] = { link = "Boolean" },
  ["@comment"] = { link = "Comment" },
  ["@variable.builtin"] = { fg = colors["blue2"] },
  ["@exception"] = { link = "Keyword" },
  ["@constant"] = { fg = colors["pink2"] },
  ["@constant.builtin"] = { fg = colors["blue2"] },
  ["@constant.falsy"] = { fg = colors["pink3"] },
  ["@constructor"] = { fg = colors["teal1"] },
  ["@attribute"] = { link = "Keyword" },
  ["@field"] = { link = "Variable" },
  ["@function.builtin"] = { fg = colors["blue2"] },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = colors["bluegray1"] },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.return"] = { link = "Keyword" },
  ["@keyword.function"] = { link = "Keyword" },
  ["@keyword.operator"] = { fg = colors["teal1"] },
  ["@label"] = { fg = colors["blue3"] },
  ["@method"] = { fg = colors["teal1"] },
  ["@operator"] = { link = "Operator" },
  ["@parameter"] = { fg = colors["bluegray1"] },
  ["@property"] = { fg = colors["blue2"] },
  ["@punctuation.delimiter"] = { fg = groups["punctuation"] },
  ["@punctuation.special"] = { fg = groups["punctuation"] },
  ["@punctuation.bracket"] = { fg = colors["text"] },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = colors["pink3"] },
  ["@tag"] = { link = "Tag" },
  ["@tag.delimiter"] = { link = "Tag" },
  ["@tag.attribute"] = { link = "Constant" },
  ["@text"] = { fg = colors["text"] },
  ["@text.uri"] = { fg = colors["teal3"], underline = true },
  ["@text.danger"] = { link = "ErrorMsg" },
  ["@title"] = { fg = groups["h1"], bold = true },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { link = "Type" },
  ["@type.qualifier"] = { link = "Keyword" },

  LspReferenceText = { bg = colors["blue2"] },
  LspReferenceRead = { bg = colors["blue2"] },
  LspReferenceWrite = { bg = colors["blue2"] },
  LspCodeLens = { fg = colors["bluegray1"] },
  LspCodeLensSeparator = { fg = colors["bluegray3"] },

  DiffAdd = { bg = git_add_bg },
  DiffChange = { bg = git_change_bg },
  DiffDelete = { bg = git_delete_bg, fg = colors["bluegray2"] },
  DiffText = {
    bg = utils.blend(git_change_bg, colors["yellow"], 0.9),
    fg = colors["yellow"],
    bold = true,
  },
  GitSignsAdd = { fg = groups["git_add"] },
  GitSignsChange = { fg = groups["git_change"] },
  GitSignsDelete = { fg = groups["git_delete"] },
  SignAdd = { link = "GitSignsAdd" },
  SignChange = { link = "GitSignsChange" },
  SignDelete = { link = "GitSignsDelete" },
  diffAdded = { link = "GitSignsAdd" },
  diffChanged = { link = "GitSignsChange" },
  diffRemoved = { link = "GitSignsRemoved" },

  DiffviewFilePanelTitle = { fg = colors["bluegray2"] },
  DiffviewPrimary = { fg = colors["teal2"] },
  DiffviewFilePanelCounter = { fg = colors["teal2"] },
  DiffviewDiffAddAsDelete = { link = "DiffDelete" },
  DiffviewDiffDeleteDim = { link = "DiffDelete" },

  NvimTreeCursorLine = { link = "CursorLine" },
  NvimTreeEmptyFolderName = { fg = colors["bluegray3"] },
  NvimTreeFileDeleted = { fg = colors["pink3"] },
  NvimTreeFileDirty = { fg = colors["blue4"] },
  NvimTreeFileMerge = { fg = colors["blue2"] },
  NvimTreeFileNew = { fg = colors["teal1"] },
  NvimTreeFileRenamed = { fg = colors["bluegray3"] },
  NvimTreeFileStaged = { fg = colors["blue1"] },
  NvimTreeFolderIcon = { fg = colors["blue3"] },
  NvimTreeFolderName = { fg = colors["blue3"] },
  NvimTreeGitDeleted = { fg = groups["git_delete"] },
  NvimTreeGitDirty = { fg = groups["git_dirty"] },
  NvimTreeGitIgnored = { fg = groups["git_ignore"] },
  NvimTreeGitMerge = { fg = groups["git_merge"] },
  NvimTreeGitNew = { fg = groups["git_add"] },
  NvimTreeGitRenamed = { fg = groups["git_rename"] },
  NvimTreeGitStaged = { fg = groups["git_stage"] },
  NvimTreeImageFile = { fg = colors["text"] },
  NvimTreeOpenedFile = { fg = colors["text"], bg = colors["background1"] },
  NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
  NvimTreeRootFolder = { fg = colors["teal1"] },
  NvimTreeSpecialFile = { link = "NvimTreeNormal" },
  NvimTreeWindowPicker = { fg = groups["bg"], bg = colors["bluegray1"] },

  NvimTreeNormal = { fg = colors["text"], bg = nvim_tree_panel_bg },
  NvimTreeNormalNC = { fg = colors["text"], bg = nvim_tree_panel_bg },
  NvimTreeWinSeparator = { fg = "line", bg = groups["background"] },

  WhichKey = { fg = colors["text"] },
  WhichKeyGroup = { fg = colors["blue3"] },
  WhichKeySeparator = { fg = colors["bluegray2"] },
  WhichKeyDesc = { fg = colors["teal2"] },
  WhichKeyFloat = { bg = groups["panel"] },
  WhichKeyValue = { fg = colors["text"] },

  IndentBlanklineChar = { fg = colors["background1"] },
  IndentBlanklineContextChar = { fg = colors["bluegray2"], nocombine = true },
  IndentBlanklineContextStart = { sp = colors["bluegray2"], bg = "IlluminatedWordText", underdotted = true },
  IndentBlanklineSpaceChar = { link = "Whitespace" },
  IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },

  IlluminatedWordRead = { bg = lighten(colors, "background1", 5) },
  IlluminatedWordText = { bg = lighten(colors, "background1", 5) },
  IlluminatedWordWrite = { bg = lighten(colors, "background1", 5) },

  CmpItemAbbr = { fg = colors["bluegray2"] },
  CmpItemAbbrDeprecated = { fg = colors["pink3"], strikethrough = true },
  CmpItemAbbrMatch = { fg = colors["text"], bold = true },
  CmpItemAbbrMatchFuzzy = { fg = colors["teal1"], bold = true },
  CmpItemKind = { fg = colors["blue3"] },
  CmpItemKindClass = { fg = colors["yellow"] },
  CmpItemKindFunction = { fg = colors["blue1"] },
  CmpItemKindInterface = { fg = colors["blue2"] },
  CmpItemKindMethod = { fg = colors["pink3"] },
  CmpItemKindSnippet = { fg = colors["bluegray1"] },
  CmpItemKindVariable = { fg = colors["teal1"] },

  LspSignatureActiveParameter = { bg = colors["bluegray1"] },

  TelescopeBorder = { fg = groups["border"] },
  TelescopeMatching = { bold = true },
  TelescopeNormal = { fg = colors["text"] },
  TelescopePromptNormal = { fg = colors["text"] },
  TelescopePromptPrefix = { fg = colors["bluegray1"] },
  TelescopeSelection = { link = "CursorLine" },
  TelescopeSelectionCaret = { fg = colors["pink2"], bg = colors["bluegray1"] },
  TelescopeTitle = { fg = colors["bluegray2"] },
  HopNextKey = { fg = lighten(colors, "blue1", 10) },
  HopNextKey1 = { fg = lighten(colors, "teal1", 10) },
  HopNextKey2 = { fg = colors["teal2"] },
  HopUnmatched = { fg = lighten(colors, "bluegray3", -10) },
  HopCursor = { fg = "NONE" },

  NotifyINFOBorder = { fg = colors["teal1"] },
  NotifyINFOTitle = { link = "NotifyINFOBorder" },
  NotifyINFOIcon = { link = "NotifyINFOBorder" },
  NotifyWARNBorder = { fg = colors["yellow"] },
  NotifyWARNTitle = { link = "NotifyWARNBorder" },
  NotifyWARNIcon = { link = "NotifyWARNBorder" },
  NotifyDEBUGBorder = { fg = colors["blue1"] },
  NotifyDEBUGTitle = { link = "NotifyDEBUGBorder" },
  NotifyDEBUGIcon = { link = "NotifyDEBUGBorder" },
  NotifyTRACEBorder = { fg = colors["blue1"] },
  NotifyTRACETitle = { link = "NotifyTRACEBorder" },
  NotifyTRACEIcon = { link = "NotifyTRACEBorder" },
  NotifyERRORBorder = { fg = colors["pink3"] },
  NotifyERRORTitle = { link = "NotifyERRORBorder" },
  NotifyERRORIcon = { link = "NotifyERRORBorder" },
}

M.setup = function(theme)
  local table = {
    override = {},
    add = {},
  }
  if theme == "poimandres" then
    for key, val in pairs(hl_groups) do
      if utils.predefined[key] then
        table.override[key] = val
      else
        table.add[key] = val
      end
    end
  end

  return table
end

return M

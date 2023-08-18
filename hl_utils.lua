local M = {
  colors = {
    yellow = "#FFFAC2",
    teal1 = "#5DE4C7",
    teal2 = "#5FB3A1",
    teal3 = "#42675A",
    blue1 = "#89DDFF",
    blue2 = "#ADD7FF",
    blue3 = "#91B4D5",
    blue4 = "#7390AA",
    pink1 = "#FAE4FC",
    pink2 = "#FCC5E9",
    pink3 = "#D0679D",
    bluegray1 = "#A6ACCD",
    bluegray2 = "#767C9D",
    bluegray3 = "#506477",
    background1 = "#303340",
    background2 = "#1B1E28",
    background3 = "#171922",
    text2 = "#E4F0FB",
    text = "#E5E5E5",
    white = "#FFFFFF",
  },
  predefined = {
    ["WhichKeyDesc"] = true,
    ["WhichKeyGroup"] = true,
    ["WhichKeyValue"] = true,
    ["WhichKey"] = true,
    ["WhichKeySeparator"] = true,
    ["TelescopeResultsDiffDelete"] = true,
    ["TelescopeBorder"] = true,
    ["TelescopePromptBorder"] = true,
    ["TelescopePromptNormal"] = true,
    ["TelescopeResultsTitle"] = true,
    ["TelescopePromptPrefix"] = true,
    ["TelescopeNormal"] = true,
    ["TelescopePreviewTitle"] = true,
    ["TelescopePromptTitle"] = true,
    ["TelescopeSelection"] = true,
    ["TelescopeResultsDiffAdd"] = true,
    ["TelescopeResultsDiffChange"] = true,
    ["TBTabTitle"] = true,
    ["TbLineThemeToggleBtn"] = true,
    ["TbLineCloseAllBufsBtn"] = true,
    ["TblineFill"] = true,
    ["TbLineBufOn"] = true,
    ["TbLineBufOff"] = true,
    ["TbLineBufOnModified"] = true,
    ["TbBufLineBufOffModified"] = true,
    ["TbLineBufOnClose"] = true,
    ["TbLineBufOffClose"] = true,
    ["TblineTabNewBtn"] = true,
    ["TbLineTabOn"] = true,
    ["TbLineTabOff"] = true,
    ["TbLineTabCloseBtn"] = true,
    ["@lsp.type.macro"] = true,
    ["@keyword.return"] = true,
    ["@lsp.type.method"] = true,
    ["Tag"] = true,
    ["@lsp.type.namespace"] = true,
    ["@operator"] = true,
    ["@lsp.type.parameter"] = true,
    ["@lsp.type.property"] = true,
    ["Structure"] = true,
    ["@lsp.type.struct"] = true,
    ["@punctuation.bracket"] = true,
    ["@lsp.type.type"] = true,
    ["Label"] = true,
    ["@lsp.type.typeParamater"] = true,
    ["@lsp.type.variable"] = true,
    ["Float"] = true,
    ["@float"] = true,
    ["@exception"] = true,
    ["@constant.macro"] = true,
    ["StorageClass"] = true,
    ["@constant"] = true,
    ["@constructor"] = true,
    ["@character"] = true,
    ["@include"] = true,
    ["@property"] = true,
    ["@field.key"] = true,
    ["@scope"] = true,
    ["@function"] = true,
    ["@attribute"] = true,
    ["Statement"] = true,
    ["@constant.builtin"] = true,
    ["Identifier"] = true,
    ["@function.macro"] = true,
    ["@lsp.type.enum"] = true,
    ["@reference"] = true,
    ["@none"] = true,
    ["@method.call"] = true,
    ["@keyword.operator"] = true,
    ["Character"] = true,
    ["@parameter"] = true,
    ["@function.call"] = true,
    ["@namespace"] = true,
    ["PreProc"] = true,
    ["@function.builtin"] = true,
    ["@method"] = true,
    ["@keyword.function"] = true,
    ["Include"] = true,
    ["Define"] = true,
    ["Keyword"] = true,
    ["Conditional"] = true,
    ["Number"] = true,
    ["Variable"] = true,
    ["Constant"] = true,
    ["Operator"] = true,
    ["Boolean"] = true,
    ["Function"] = true,
    ["String"] = true,
    ["@punctuation.delimiter"] = true,
    ["@punctuation.special"] = true,
    ["@string"] = true,
    ["@string.regex"] = true,
    ["@string.escape"] = true,
    ["@string.special"] = true,
    ["@symbol"] = true,
    ["@tag"] = true,
    ["@tag.attribute"] = true,
    ["@tag.delimiter"] = true,
    ["@text"] = true,
    ["@text.strong"] = true,
    ["@text.emphasis"] = true,
    ["@text.strike"] = true,
    ["@text.literal"] = true,
    ["@text.uri"] = true,
    ["@type.builtin"] = true,
    ["@definition"] = true,
    ["@variable"] = true,
    ["@field"] = true,
    ["@variable.builtin"] = true,
    ["Delimiter"] = true,
    ["@conditional"] = true,
    ["Repeat"] = true,
    ["Special"] = true,
    ["SpecialChar"] = true,
    ["@annotation"] = true,
    ["Todo"] = true,
    ["Typedef"] = true,
    ["@lsp.type.class"] = true,
    ["@lsp.type.decorator"] = true,
    ["Type"] = true,
    ["@lsp.type.enumMember"] = true,
    ["@error"] = true,
    ["@lsp.type.function"] = true,
    ["@lsp.type.interface"] = true,
    ["@keyword"] = true,
    ["NvimTreeGitNew"] = true,
    ["NvimTreeGitDirty"] = true,
    ["NvimTreeFolderIcon"] = true,
    ["NvimTreeFolderName"] = true,
    ["NvimTreeGitIgnored"] = true,
    ["NvimTreeOpenedFolderName"] = true,
    ["NvimTreeNormal"] = true,
    ["NvimTreeIndentMarker"] = true,
    ["NvimTreeEndOfBuffer"] = true,
    ["NvimTreeNormalNC"] = true,
    ["NvimTreeWinSeparator"] = true,
    ["NvimTreeWindowPicker"] = true,
    ["NvimTreeCursorLine"] = true,
    ["NvimTreeEmptyFolderName"] = true,
    ["NvimTreeRootFolder"] = true,
    ["NvimTreeSpecialFile"] = true,
    ["NvimTreeGitDeleted"] = true,
    ["NvDashAscii"] = true,
    ["NvDashButtons"] = true,
    ["NvChHeadred"] = true,
    ["NvChHeadblue"] = true,
    ["NvChHeading"] = true,
    ["NvChSection"] = true,
    ["NvChAsciiHeader"] = true,
    ["NvChHeadteal"] = true,
    ["NvChHeadvibrant_green"] = true,
    ["NvChHeadcyan"] = true,
    ["NvChHeadwhite"] = true,
    ["NvChHeadpurple"] = true,
    ["NvChHeadbaby_pink"] = true,
    ["NvChHeadorange"] = true,
    ["NvChHeadyellow"] = true,
    ["NvChHeadgreen"] = true,
    ["nvUpdaterTitleDone"] = true,
    ["nvUpdaterTitleFAIL"] = true,
    ["nvUpdaterProgress"] = true,
    ["nvUpdaterProgressDONE"] = true,
    ["nvUpdaterProgressFAIL"] = true,
    ["nvUpdaterCommits"] = true,
    ["nvUpdaterFAIL"] = true,
    ["nvUpdaterTitle"] = true,
    ["MasonHeader"] = true,
    ["MasonHighlight"] = true,
    ["MasonHighlightBlockBold"] = true,
    ["MasonHighlightBlock"] = true,
    ["MasonHeaderSecondary"] = true,
    ["MasonMuted"] = true,
    ["MasonMutedBlock"] = true,
    ["DiagnosticWarn"] = true,
    ["LspReferenceText"] = true,
    ["LspSignatureActiveParameter"] = true,
    ["LspReferenceRead"] = true,
    ["RenamerBorder"] = true,
    ["DiagnosticHint"] = true,
    ["DiagnosticError"] = true,
    ["RenamerTitle"] = true,
    ["DiagnosticInformation"] = true,
    ["LspReferenceWrite"] = true,
    ["diffOldFile"] = true,
    ["diffNewFile"] = true,
    ["DiffAdded"] = true,
    ["DiffModified"] = true,
    ["DiffRemoved"] = true,
    ["DiffText"] = true,
    ["gitcommitOverflow"] = true,
    ["gitcommitSummary"] = true,
    ["gitcommitComment"] = true,
    ["gitcommitUntracked"] = true,
    ["gitcommitDiscarded"] = true,
    ["gitcommitSelected"] = true,
    ["gitcommitHeader"] = true,
    ["gitcommitSelectedType"] = true,
    ["gitcommitUnmergedType"] = true,
    ["gitcommitDiscardedType"] = true,
    ["gitcommitBranch"] = true,
    ["gitcommitUntrackedFile"] = true,
    ["DiffAdd"] = true,
    ["DiffChange"] = true,
    ["gitcommitSelectedFile"] = true,
    ["gitcommitDiscardedFile"] = true,
    ["DiffDelete"] = true,
    ["gitcommitUnmergedFile"] = true,
    ["DiffChangeDelete"] = true,
    ["DevIconmp3"] = true,
    ["DevIconlua"] = true,
    ["DevIconMd"] = true,
    ["DevIcontoml"] = true,
    ["DevIconc"] = true,
    ["DevIconcss"] = true,
    ["DevIcondeb"] = true,
    ["DevIconDockerfile"] = true,
    ["DevIconhtml"] = true,
    ["DevIconjpeg"] = true,
    ["DevIconjpg"] = true,
    ["DevIconjs"] = true,
    ["DevIconkt"] = true,
    ["DevIconlock"] = true,
    ["DevIconDefault"] = true,
    ["DevIconmp4"] = true,
    ["DevIconout"] = true,
    ["DevIconpng"] = true,
    ["DevIconpy"] = true,
    ["DevIconts"] = true,
    ["DevIconttf"] = true,
    ["DevIconrb"] = true,
    ["DevIconrpm"] = true,
    ["DevIconvue"] = true,
    ["DevIconwoff"] = true,
    ["DevIconwoff2"] = true,
    ["DevIconxz"] = true,
    ["DevIconzip"] = true,
    ["DevIconZig"] = true,
    ["DevIconTSX"] = true,
    ["DevIconJSX"] = true,
    ["DevIconSvelte"] = true,
    ["DevIconJava"] = true,
    ["LazyH2"] = true,
    ["SpellLocal"] = true,
    ["SpellCap"] = true,
    ["SignColumn"] = true,
    ["SpellRare"] = true,
    ["healthSuccess"] = true,
    ["LazyReasonPlugin"] = true,
    ["LazyReasonFt"] = true,
    ["St_VisualMode"] = true,
    ["LazyReasonKeys"] = true,
    ["LazyReasonEvent"] = true,
    ["LazyReasonStart"] = true,
    ["LazyReasonRuntime"] = true,
    ["St_InsertMode"] = true,
    ["LazyReasonSource"] = true,
    ["LazyReasonImport"] = true,
    ["FloatBorder"] = true,
    ["LazyButton"] = true,
    ["St_SelectModeSep"] = true,
    ["WinSeparator"] = true,
    ["St_CommandModeSep"] = true,
    ["Error"] = true,
    ["St_ConfirmModeSep"] = true,
    ["LazyNoCond"] = true,
    ["St_ReplaceModeSep"] = true,
    ["LazyH1"] = true,
    ["St_NTerminalModeSep"] = true,
    ["NormalFloat"] = true,
    ["St_TerminalModeSep"] = true,
    ["St_ReplaceMode"] = true,
    ["St_InsertModeSep"] = true,
    ["St_SelectMode"] = true,
    ["St_VisualModeSep"] = true,
    ["LazyReasonCmd"] = true,
    ["St_NormalModeSep"] = true,
    ["St_CommandMode"] = true,
    ["St_NormalMode"] = true,
    ["St_LspStatus"] = true,
    ["St_LspStatus_Icon"] = true,
    ["St_EmptySpace2"] = true,
    ["LazyValue"] = true,
    ["St_file_sep"] = true,
    ["LazyUrl"] = true,
    ["St_cwd_text"] = true,
    ["St_cwd_sep"] = true,
    ["St_pos_sep"] = true,
    ["St_pos_icon"] = true,
    ["St_pos_text"] = true,
    ["Title"] = true,
    ["St_cwd_icon"] = true,
    ["StatusLine"] = true,
    ["LazyOperator"] = true,
    ["LazyCommit"] = true,
    ["St_file_info"] = true,
    ["St_LspProgress"] = true,
    ["St_EmptySpace"] = true,
    ["St_LspInfo"] = true,
    ["St_gitIcons"] = true,
    ["St_LspHints"] = true,
    ["Bold"] = true,
    ["LazyCommitIssue"] = true,
    ["LazyDir"] = true,
    ["St_NTerminalMode"] = true,
    ["Italic"] = true,
    ["St_lspWarning"] = true,
    ["St_lspError"] = true,
    ["CursorLine"] = true,
    ["Directory"] = true,
    ["IncSearch"] = true,
    ["LazyTaskOutput"] = true,
    ["PmenuSel"] = true,
    ["LazySpecial"] = true,
    ["SpellBad"] = true,
    ["WarningMsg"] = true,
    ["St_ConfirmMode"] = true,
    ["St_TerminalMode"] = true,
    ["ErrorMsg"] = true,
    ["CursorLineNr"] = true,
    ["LineNr"] = true,
    ["LazyProgressDone"] = true,
    ["CursorColumn"] = true,
    ["NonText"] = true,
    ["Comment"] = true,
    ["Normal"] = true,
    ["Pmenu"] = true,
    ["PmenuSbar"] = true,
    ["PmenuThumb"] = true,
    ["MatchWord"] = true,
    ["MatchParen"] = true,
    ["Search"] = true,
    ["NvimInternalError"] = true,
    ["Debug"] = true,
    ["Exception"] = true,
    ["FoldColumn"] = true,
    ["Folded"] = true,
    ["Macro"] = true,
    ["ModeMsg"] = true,
    ["MoreMsg"] = true,
    ["Question"] = true,
    ["Substitute"] = true,
    ["SpecialKey"] = true,
    ["TooLong"] = true,
    ["UnderLined"] = true,
    ["Visual"] = true,
    ["VisualNOS"] = true,
    ["WildMenu"] = true,
    ["Conceal"] = true,
    ["Cursor"] = true,
    ["ColorColumn"] = true,
    ["QuickFixLine"] = true,
    ["CmpItemAbbr"] = true,
    ["CmpItemAbbrMatch"] = true,
    ["CmpDoc"] = true,
    ["CmpDocBorder"] = true,
    ["CmpPmenu"] = true,
    ["CmpSel"] = true,
    ["CmpItemKindConstant"] = true,
    ["CmpItemKindFunction"] = true,
    ["CmpItemKindIdentifier"] = true,
    ["CmpItemKindField"] = true,
    ["CmpItemKindVariable"] = true,
    ["CmpItemKindSnippet"] = true,
    ["CmpItemKindText"] = true,
    ["CmpItemKindStructure"] = true,
    ["CmpItemKindType"] = true,
    ["CmpItemKindKeyword"] = true,
    ["CmpItemKindMethod"] = true,
    ["CmpItemKindConstructor"] = true,
    ["CmpItemKindFolder"] = true,
    ["CmpItemKindModule"] = true,
    ["CmpItemKindProperty"] = true,
    ["CmpItemKindEnum"] = true,
    ["CmpItemKindUnit"] = true,
    ["CmpItemKindClass"] = true,
    ["CmpItemKindFile"] = true,
    ["CmpItemKindInterface"] = true,
    ["CmpItemKindColor"] = true,
    ["CmpItemKindReference"] = true,
    ["CmpItemKindEnumMember"] = true,
    ["CmpItemKindStruct"] = true,
    ["CmpItemKindValue"] = true,
    ["CmpItemKindEvent"] = true,
    ["CmpItemKindOperator"] = true,
    ["CmpItemKindTypeParameter"] = true,
    ["CmpItemKindCopilot"] = true,
    ["CmpBorder"] = true,
    ["IndentBlanklineChar"] = true,
    ["IndentBlanklineSpaceChar"] = true,
    ["IndentBlanklineContextStart"] = true,
    ["IndentBlanklineContextChar"] = true,
    ["ExtendedHLGroups"] = true,
    ["NotifyTRACEBorder"] = true,
    ["NotifyTRACEIcon"] = true,
    ["NotifyTRACETitle"] = true,
    ["NotifyERRORBorder"] = true,
    ["NotifyERRORIcon"] = true,
    ["NotifyERRORTitle"] = true,
    ["NotifyWARNBorder"] = true,
    ["NotifyWARNIcon"] = true,
    ["NotifyWARNTitle"] = true,
    ["NotifyINFOBorder"] = true,
    ["NotifyINFOIcon"] = true,
    ["NotifyINFOTitle"] = true,
    ["NotifyDEBUGBorder"] = true,
    ["NotifyDEBUGIcon"] = true,
    ["NotifyDEBUGTitle"] = true,
    ["DapUIWatchesEmpty"] = true,
    ["DapUIFloatBorder"] = true,
    ["DapUILineNumber"] = true,
    ["DapUISource"] = true,
    ["DapUIStoppedThread"] = true,
    ["DapUIThread"] = true,
    ["DapUIDecoration"] = true,
    ["DapUIModifiedValue"] = true,
    ["DAPUIVariable"] = true,
    ["DAPUIValue"] = true,
    ["DAPUIType"] = true,
    ["DAPUIScope"] = true,
    ["DapStopped"] = true,
    ["DapLogPoint"] = true,
    ["DapBreakpointCondition"] = true,
    ["DapBreakpoint"] = true,
    ["DapUIUnavailable"] = true,
    ["DapUIRestart"] = true,
    ["DapUIPlayPause"] = true,
    ["DapUIStop"] = true,
    ["DapUIStepOut"] = true,
    ["DapUIStepBack"] = true,
    ["DapUIStepInto"] = true,
    ["DapUIStepOver"] = true,
    ["DapUIBreakpointsDisabledLine"] = true,
    ["DapUIBreakPointsCurrentLine"] = true,
    ["DapUIBreakpointsInfo"] = true,
    ["DapUIBreakpointsPath"] = true,
    ["DapUIWatchesError"] = true,
    ["DapUIWatchesValue"] = true,
    ["BufferlineIndicatorVisible"] = true,
    ["BufferLineBufferSelected"] = true,
    ["BufferLineBufferVisible"] = true,
    ["BufferLineError"] = true,
    ["BufferLineErrorDiagnostic"] = true,
    ["BufferLineCloseButton"] = true,
    ["BufferLineCloseButtonVisible"] = true,
    ["BufferLineCloseButtonSelected"] = true,
    ["BufferLineFill"] = true,
    ["BufferlineIndicatorSelected"] = true,
    ["BufferLineModified"] = true,
    ["BufferLineModifiedVisible"] = true,
    ["BufferLineModifiedSelected"] = true,
    ["BufferLineSeparator"] = true,
    ["BufferLineSeparatorVisible"] = true,
    ["BufferLineSeparatorSelected"] = true,
    ["BufferLineTab"] = true,
    ["BufferLineTabSelected"] = true,
    ["BufferLineTabClose"] = true,
    ["BufferLineDevIconDefaultSelected"] = true,
    ["BufferLineDevIconDefaultInactive"] = true,
    ["BufferLineDuplicate"] = true,
    ["BufferLineDuplicateSelected"] = true,
    ["BufferLineDuplicateVisible"] = true,
    ["BufferLineRightCustomAreaText1"] = true,
    ["BufferLineRightCustomAreaText2"] = true,
    ["BufferLineBackground"] = true,
    ["AlphaHeader"] = true,
    ["AlphaButtons"] = true,
  },
}

M.groups = {
  background = M.colors["background2"],
  panel = M.colors["background3"],
  border = M.colors["background3"],
  comment = M.colors["bluegray3"],
  link = M.colors["blue3"],
  punctuation = M.colors["blue3"],
  error = M.colors["pink3"],
  hint = M.colors["blue3"],
  info = M.colors["blue1"],
  warn = M.colors["yellow"],
  git_add = M.colors["teal1"],
  git_change = M.colors["blue2"],
  git_delete = M.colors["pink3"],
  git_dirty = M.colors["blue4"],
  git_ignore = M.colors["bluegray1"],
  git_merge = M.colors["blue2"],
  git_rename = M.colors["teal3"],
  git_stage = M.colors["blue1"],
  git_text = M.colors["teal2"],
  h1 = M.colors["teal2"],
  h2 = M.colors["yellow"],
  h3 = M.colors["pink3"],
  h4 = M.colors["pink2"],
  h5 = M.colors["blue1"],
  h6 = M.colors["blue2"],
}

local function byte(value, offset)
  return bit.band(bit.rshift(value, offset), 0xFF)
end

local function parse_color(color)
  if color == nil then
    return print "invalid color"
  end

  color = color:lower()

  if not color:find "#" and color ~= "none" and color:find "^o_" ~= nil then
    color = M.colors[color:sub(3)]
  end

  return color
end

local function rgb(color)
  color = vim.api.nvim_get_color_by_name(color)

  if color == -1 then
    color = vim.opt.background:get() == "dark" and 000 or 255255255
  end

  return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local blend = function(fg, bg, alpha)
  fg = rgb(parse_color(fg))
  bg = rgb(parse_color(bg))

  local function blend_channel(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

local rgb2hex = function(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

local rgb2hsl = function(r, g, b)
  local min, max, l, s, maxcolor, h
  r, g, b = r / 255, g / 255, b / 255

  min = math.min(r, g, b)
  max = math.max(r, g, b)
  maxcolor = 1 + (max == b and 2 or (max == g and 1 or 0))

  if maxcolor == 1 then
    h = (g - b) / (max - min)
  elseif maxcolor == 2 then
    h = 2 + (b - r) / (max - min)
  elseif maxcolor == 3 then
    h = 4 + (r - g) / (max - min)
  end

  if not rawequal(type(h), "number") then
    h = 0
  end

  h = h * 60

  if h < 0 then
    h = h + 360
  end

  l = (min + max) / 2

  if min == max then
    s = 0
  else
    if l < 0.5 then
      s = (max - min) / (max + min)
    else
      s = (max - min) / (2 - max - min)
    end
  end

  return h, s, l
end

local hsl2rgb_helper = function(p, q, a)
  if a < 0 then
    a = a + 6
  end
  if a >= 6 then
    a = a - 6
  end
  if a < 1 then
    return (q - p) * a + p
  elseif a < 3 then
    return q
  elseif a < 4 then
    return (q - p) * (4 - a) + p
  else
    return p
  end
end
local hex2rgb = function(hex)
  local hash = string.sub(hex, 1, 1) == "#"
  if string.len(hex) ~= (7 - (hash and 0 or 1)) then
    return nil
  end

  local r = tonumber(hex:sub(2 - (hash and 0 or 1), 3 - (hash and 0 or 1)), 16)
  local g = tonumber(hex:sub(4 - (hash and 0 or 1), 5 - (hash and 0 or 1)), 16)
  local b = tonumber(hex:sub(6 - (hash and 0 or 1), 7 - (hash and 0 or 1)), 16)
  return r, g, b
end
local hsl2rgb = function(h, s, l)
  local t1, t2, r, g, b

  h = h / 60
  if l <= 0.5 then
    t2 = l * (s + 1)
  else
    t2 = l + s - (l * s)
  end

  t1 = l * 2 - t2
  r = hsl2rgb_helper(t1, t2, h + 2) * 255
  g = hsl2rgb_helper(t1, t2, h) * 255
  b = hsl2rgb_helper(t1, t2, h - 2) * 255

  return r, g, b
end

local hex2hsl = function(hex)
  local r, g, b = hex2rgb(hex)
  return rgb2hsl(r, g, b)
end

local hsl2hex = function(h, s, l)
  local r, g, b = hsl2rgb(h, s, l)
  return rgb2hex(r, g, b)
end

local change_hex_lightness = function(hex, percent)
  local h, s, l = hex2hsl(hex)
  l = l + (percent / 100)
  if l > 1 then
    l = 1
  end
  if l < 0 then
    l = 0
  end
  return hsl2hex(h, s, l)
end

M.blend = blend
M.change_hex_lightness = change_hex_lightness

return M

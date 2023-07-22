-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
local M = {}
local illuminate_color = "#494d52"
---@return Base46HLGroupsList
M.override = function(theme)
  local grey = "light_grey"

  if string.match(theme, "light") then
    grey = "grey_fg2"
  end
  return {
    Visual = {bg = "one_bg3"},
    TelescopeSelection = { bg = "one_bg3" },
    NvimTreeGitIgnored = { fg = grey },
    StText = { fg = grey },
    TbLineBufOff = { fg = grey, bg = "black2" },
    CursorLine = {
      bg = "one_bg2",
    },
    Comment = {
      italic = true,
    },
    IndentBlanklineContextStart = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    LspReferenceText = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    LspReferenceRead = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    LspReferenceWrite = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    DiffAdd = { fg = "blue" },
    DiffAdded = { fg = "green" },
    DiffChange = { fg = "orange" },
    DiffChangeDelete = { fg = "red" },
    DiffModified = { fg = "orange" },
    DiffDelete = { fg = "red" },
    DiffRemoved = { fg = "red" },
    DiffText = { fg = "white", bg = "black2" },
    ["@include"] = { fg = "cyan", link = "" },
    ["@attribute"] = { fg = "cyan", link = "" },
    ["@field"] = { fg = "blue", link = "" },
    ["@punctuation.bracket"] = { fg = "cyan", link = "" },
    ["@punctuation.delimiter"] = { fg = "cyan", link = "" },
    ["@punctuation.special"] = { fg = "cyan", link = "" },
    -- ["@parameter"] = { fg = colors.base0A, link = "" },
    ["@type"] = { fg = "yellow", link = "" },
    ["@function"] = { fg = "blue", link = "" },
    ["@tag.delimiter"] = { fg = "cyan", link = "" },
    ["@property"] = { fg = "yellow", link = "" },
    ["@method"] = { fg = "blue", link = "" },
    ["@constructor"] = { fg = "blue", link = "" },
    -- ["@variable"] = { fg = colors.base06, link = "" },
    ["@operator"] = { fg = "cyan", link = "" },
    -- ["@constant.builtin"] = { fg = colors.base0A, link = "" },
    ["@tag"] = { fg = "blue", link = "" },
    ["@keyword"] = { fg = "cyan", link = "" },
    ["@keyword.operator"] = { fg = "red", link = "" },
    ["@keyword.function"] = { fg = "red", link = "" },
    ["@variable.builtin"] = { fg = "red", link = "" },
    ["@label"] = { fg = "cyan", link = "" },
    ["@conditional"] = { fg = "red", link = "" },
    -- ["@namespace"] = { fg = colors.base07, link = "" },
    ["@symbol"] = { fg = "green", link = "" },
    ["@exception"] = { fg = "red", link = "" },
    ["@text.uri"] = { underline = false },
  }
end

---@return HLTable
M.add = function()
  return {
    ["@text.title"] = { fg = "white", link = "" },
    ["@keyword.coroutine"] = { fg = "purple", link = "" },
    ["@boolean"] = { fg = "orange" },
    ["@type.qualifier"] = { fg = "cyan", link = "" },
    IlluminatedWordText = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    IlluminatedWordRead = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
    IlluminatedWordWrite = {
      -- link = "PmenuThumb",
      bg = illuminate_color,
    },
  }
end

return M

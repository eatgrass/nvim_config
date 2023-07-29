-- https://github.com/olivercederborg/poimandres.nvim
local M = {}

local util = require "base46.colors"

---------- util functions ----------------------

local function byte(value, offset)
  return bit.band(bit.rshift(value, offset), 0xFF)
end

local function parse_color(color)
  if color == nil then
    return print "invalid color"
  end

  color = color:lower()

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

local origin = {
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
}

M.base_30 = {
  white = "#FFFFFF", -- set
  darker_black = "#171922", --set
  black = "#1B1E28", -- set
  black2 = "#252731", --set
  one_bg = "#2f3446", --set
  one_bg2 = "#424961", --set
  one_bg3 = "#525b7a", --set
  grey = "#506477", -- set
  grey_fg = "#767C9D", --set
  grey_fg2 = "#A6ACCD", --set
  light_grey = "#7390AA", --set
  red = "#D0679D", -- set
  baby_pink = "#FAE4FC", -- set
  pink = "#FCC5E9",
  line = "#394055", -- for lines like vertsplit
  green = "#5FB3A1",
  vibrant_green = "#5DE4C7",
  blue = "#ADD7FF",
  nord_blue = "#91B4D5",
  yellow = "#FFFAC2",
  sun = "#FFFAC2",
  purple = "#D0679D",
  dark_purple = "#D0679D",
  teal = "#42675A",
  orange = "#E8CCA7",
  cyan = "#89DDFF",
  statusline_bg = "#12141B",
  lightbg = "#2c3142",
  pmenu_bg = "#303340",
  folder_bg = "#91B4D5",

  o_yellow = "#FFFAC2",
  o_teal1 = "#5DE4C7",
  o_teal2 = "#5FB3A1",
  o_teal3 = "#42675A",
  o_blue1 = "#89DDFF",
  o_blue2 = "#ADD7FF",
  o_blue3 = "#91B4D5",
  o_blue4 = "#7390AA",
  o_pink1 = "#FAE4FC",
  o_pink2 = "#FCC5E9",
  o_pink3 = "#D0679D",
  o_bluegray1 = "#A6ACCD",
  o_bluegray2 = "#767C9D",
  o_bluegray3 = "#506477",
  o_background1 = "#303340",
  o_background2 = "#1B1E28",
  o_background3 = "#171922",
  o_text = "#E5E5E5",
  o_text2 = "#E4F0FB",
  o_white = "#FFFFFF",
  -- o_none = "NONE",

  g_background = origin["background2"],
  g_panel = origin["background3"],
  g_border = origin["background3"],
  g_comment = origin["bluegray3"],
  g_link = origin["blue3"],
  g_punctuation = origin["blue3"],
  g_error = origin["pink3"],
  g_hint = origin["blue1"],
  g_info = origin["blue3"],
  g_warn = origin["yellow"],
  g_git_add = origin["teal1"],
  g_git_change = origin["blue2"],
  g_git_delete = origin["pink3"],
  g_git_dirty = origin["blue4"],
  g_git_ignore = origin["bluegray1"],
  g_git_merge = origin["blue2"],
  g_git_rename = origin["teal3"],
  g_git_stage = origin["blue1"],
  g_git_text = origin["teal2"],
  g_h1 = origin["teal2"],
  g_h2 = origin["yellow"],
  g_h3 = origin["pink3"],
  g_h4 = origin["pink2"],
  g_h5 = origin["blue1"],
  g_h6 = origin["blue2"],
}

M.base_16 = {
  base00 = "#1B1E28",
  base01 = "#292D3D",
  base02 = "#373C52",
  base03 = "#454b67",
  base04 = "#535a7c",
  base05 = "#FFFFFF",
  base06 = "#FFFFFF",
  base07 = "#FFFFFF",
  base08 = "#fae4fc",
  base09 = "#FFFAC2",
  base0A = "#FFFAC2",
  base0B = "#5DE4C7",
  base0C = "#89DDFF",
  base0D = "#89DDFF",
  base0E = "#FCC5E9",
  base0F = "#D0679D",
}

M.polish_hl = {
  DiffAdd = { bg = blend(M.base_30["g_git_add"], M.base_30["g_background"], 0.5) },
  DiffChange = { bg = blend(M.base_30["g_git_change"], M.base_30["g_background"], 0.5) },
  DiffDelete = { bg = blend(M.base_30["g_git_delete"], M.base_30["g_background"], 0.5) },
  DiffText = {
    bg = blend(M.base_30["g_git_change"], M.base_30["g_background"], 0.3),
    bold = true,
    fg = util.change_hex_lightness(M.base_30["o_bluegray1"], 8),
  },
  -- DiffText = { bold = true, bg = { "g_git_change", 8 }, fg = "o_bluegray3" },
}

M.type = "dark"

M = require("base46").override_theme(M, "poimandres")

return M

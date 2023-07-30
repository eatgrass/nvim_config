-- https://github.com/olivercederborg/poimandres.nvim
local M = {}

local utils = require "custom.hl_utils"
local theme = utils.colors

M.base_30 = {
  white = theme["text2"], -- set
  darker_black = theme["background3"], --set
  black = theme["background2"], -- set
  black2 = "#252731", --set
  one_bg = "#2f3446", --set
  one_bg2 = "#424961", --set
  one_bg3 = "#525b7a", --set
  grey = theme["bluegray3"], -- set
  grey_fg = theme["bluegray2"], --set
  grey_fg2 = theme["bluegray1"], --set
  light_grey = theme["blue4"], --set
  red = theme["pink3"], -- set
  baby_pink = theme["pink1"], -- set
  pink = theme["pink2"],
  line = "#394055", -- for lines like vertsplit
  green = theme["teal2"],
  vibrant_green = theme["teal1"],
  blue = theme["blue2"],
  nord_blue = theme["blue3"],
  yellow = theme["yellow"],
  sun = theme["yellow"],
  purple = theme["pink3"],
  dark_purple = theme["pink3"],
  teal = theme["teal3"],
  orange = "#E8CCA7",
  cyan = theme["blue1"],
  statusline_bg = "#12141B",
  lightbg = "#2c3142",
  pmenu_bg = theme["teal3"],
  folder_bg = theme["blue2"],
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

M.type = "dark"

M = require("base46").override_theme(M, "poimandres")

return M

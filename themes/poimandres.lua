-- https://github.com/olivercederborg/poimandres.nvim
local M = {}

local utils = require "custom.hl_utils"
local theme = utils.colors

M.base_30 = {
  white = theme['text2'], -- set
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

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files

local theme = "poimandres"
local transparency = true

local highlights = require("custom.highlights").setup(theme, transparency)

M.ui = {
  theme = theme,
  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = false,
  transparency = transparency,
  statusline = {
    theme = "vscode_colored",
    overriden_modules = function(modules)
      local st_modules = require "nvchad.statusline.vscode_colored"

      modules[1] = (function()
        local m = vim.api.nvim_get_mode().mode
        return "%#" .. st_modules.modes[m][2] .. "#▊ " .. st_modules.modes[m][1] .. " "
      end)()

      modules[3] = (function()
        if not vim.g.gitsigns_head then
          return ""
        end
        -- 
        return "%#St_LspHints#  " .. vim.g.gitsigns_head .. "  "
      end)()

      modules[6] = ""

      modules[9] = vim.o.columns > 140 and "%#StText#  %l, %c  " or ""
    end,
  },
  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

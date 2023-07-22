---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

local theme = "oceanic-next"

M.ui = {
  theme = theme,
  theme_toggle = { "oceanic-next", "oceanic-next" },
  hl_override = highlights.override(theme),
  hl_add = highlights.add(theme),
  transparency = true,
  statusline = {
    theme = "vscode_colored",
    overriden_modules = function()
      local st_modules = require("nvchad_ui.statusline.vscode_colored")
      return {
        mode = function()
          local m = vim.api.nvim_get_mode().mode
          return "%#" .. st_modules.modes[m][2] .. "#▊ " .. st_modules.modes[m][1] .. " "
        end,
        LSP_progress = function()
          return ""
        end,
        git = function()
          if not vim.g.gitsigns_head then
            return ""
          end
          -- 
          return "%#St_LspHints#  " .. vim.g.gitsigns_head .. "  "
        end,
      }
    end,
  },
  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M

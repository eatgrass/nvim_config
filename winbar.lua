local M = {}
M.winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "neo-tree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "NvimTree",
}

local get_navic = function()
  local status_ok, navic = pcall(require,"nvim-navic")
  if not status_ok then return "" end

  local status_loc_ok, navic_location = pcall(navic.get_location, {})
  if not status_loc_ok then return "" end

  if not navic.is_available() or navic_location == "error" then return "" end
  if not (navic_location == nil or navic_location =="") then
    return navic_location
  else
    return ""
  end
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes() then return end
  local value = " " -- get_filename()
  -- local navic_added = false

  local navic_value = get_navic()
  if not (navic_value == nil or navic_value == "") then
    value = value .. navic_value
    -- navic_added = true
  end
  -- if not (value == nil or value == "") then
  --   local navic_value = get_navic()
  --   value = navic_value
  --   if not (navic_value == nil or navic_value == "") then navic_added = true end
  -- end

  -- if not (value == nil or value == "") and get_buf_option("mod") then
  --   local mod = "%#LineNr#" .. "" .. "%*"
  --   if navic_added then
  --     value = value .. " " .. mod
  --   else
  --     value = value .. mod
  --   end
  -- end
  --

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then return end
end



return M

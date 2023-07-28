-- local autocmd = vim.api.nvim_create_autocmd
vim.g.mapleader = "\\"
vim.opt.cursorline = true
vim.opt.rnu = true
vim.opt.foldmethod = "manual" -- expr or manual
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
vim.opt.encoding = "UTF-8"
vim.opt.fixendofline = false

vim.api.nvim_exec2("language en_US.UTF-8", { output = true })
-- vim.cmd("setlocal spell spelllang=en_us")

-- vim.diagnostic.config {
--   virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
--   signs = { severity = { min = vim.diagnostic.severity.ERROR } },
--   underline = { severity = { min = vim.diagnostic.severity.ERROR } },
-- }
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- autocmd("FileType", {
--   pattern = "java",
--   callback = function()
--     local config = require('custom.lsp.jdtls')
--     require('jdtls').start_or_attach(config)
--   end
-- })
--
local group = vim.api.nvim_create_augroup("MyCustomNeogitEvents", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "NeogitPushComplete",
  group = group,
  callback = function()
    require("neogit").close()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    -- only files please
    if not real_file and not no_name then
      return
    end

    -- open the tree but don't focus it
    require("nvim-tree.api").tree.toggle { focus = false }
  end,
})



-- vim.api.nvim_create_autocmd({
--   "CursorMoved",
--   "BufWinEnter",
--   "BufFilePost",
--   "InsertEnter",
--   "BufWritePost",
-- }, {
--   callback = function()
--     require("custom.winbar").get_winbar()
--   end,
-- })
--

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "DiffviewFiles",
    "DiffviewFileHistory",
  },
  callback = function()
    vim.cmd "nnoremap <silent> <buffer> q :DiffviewClose<CR>"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "fugitiveblame",
    "fugitive",
    "tsplayground",
    "vim-plug",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd [[
      set conceallevel=2
      set wrap
      set foldlevel=99
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 2000 }
  end,
})

vim.api.nvim_create_user_command("CurrentHighlight", function()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end, {})

vim.api.nvim_create_user_command("ReloadTheme", function()
  require('base46').load_all_highlights()
end, {})

vim.api.nvim_create_user_command("PlainTreesiter", function()
  require("custom.plain_colors").setup()
end, {})

vim.api.nvim_create_user_command("PickWindow", function()
  local hl = vim.api.nvim_get_hl(0, { name = "NvimTreeWindowPicker" })
  local option = {
    show_prompt = false,
    highlights = {
      statusline = {
        focused = hl,
        unfocused = hl,
      },
    },
    filter_rules = {
      include_current_win = false,
      bo = {
        filetype = {},
      },
    },
    -- picker_config = {
    --   statusline_winbar_picker = {
    --     selection_display = function(char, winowid)
    --       return char .. "(" .. winowid .. ")"
    --     end,
    --   },
    -- },
  }
  local win_id = require("window-picker").pick_window(option) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(win_id)
end, {})

local neogit_group = vim.api.nvim_create_augroup("MyCustomNeogitEvents", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "NeogitStatusRefreshed",
  group = neogit_group,
  callback = function()
    require("nvim-tree.api").tree.reload()
  end,
})

-- enhance ui
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local colors = require("base46").get_theme_tb "base_30"
    -- local theme = require("base46").get_theme_tb "base_16"
    -- local generate_color = require("base46.colors").change_hex_lightness

    vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "DiffAdded", { fg = colors.green })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.light_grey })
    vim.api.nvim_set_hl(0, "DiffChangeDelete", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DiffModified", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DiffRemoved", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DiffText", { fg = colors.white, bg = colors.black2 })
  end,
})

-- fix java doc render
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
  if contents ~= nil then
    for i, content in pairs(contents) do
      contents[i] = content:gsub("%]%(.-%)", "]()")
    end
  end
  local bufnr, winid = orig_util_open_floating_preview(contents, syntax, opts)
  if syntax == "markdown" then
    vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
  end

  return bufnr, winid
end

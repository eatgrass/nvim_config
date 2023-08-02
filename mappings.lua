---@type MappingsTable
local M = {}

local scrolloff = false
local toggle_scrolloff = function()
  if scrolloff then
    vim.cmd "set so=0"
    print "cursor center off"
  else
    vim.cmd "set so=999"
    print "cursor center on"
  end
  scrolloff = not scrolloff
end

vim.api.nvim_create_user_command("ToggleScrollOff", toggle_scrolloff, {})

M.general = {
  n = {
    -- ["j"] = {"jzz", opts= {noremap=true}},
    -- ["k"] = {"kzz", opts= {noremap=true}},
    ["*"] = { "<cmd>keepjumps normal! mi*`i<CR>", "", opts = { noremap = true } },
    ["<Leader>fe"] = { "<Leader>fb<C-t>", "", opts = { noremap = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "hop in line", opts = { noremap = true } },
    ["q"] = { "<cmd>HopChar1<cr>", "hop in buffer", opts = { noremap = true } },
    ["<F7>"] = { "<Cmd>DapStepInto<CR>", "Debug Step Into", opts = { noremap = true } },
    ["<F8>"] = { "<Cmd>DapStepOver<CR>", "Debug Step Over", opts = { noremap = true } },
    ["<F9>"] = { "<Cmd>DapStepOut<CR>", "Debug Step Out", opts = { noremap = true } },
    ["<C-h>"] = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format", opts = { noremap = true, silent = true } },
    ["<C-l>"] = { "<Cmd>PickWindow<CR>", "Pick Window", opts = { noremap = true, silent = true } },
    ["<Up>"] = { "<cmd>resize +2<cr>", "Window Height+", opts = { noremap = true } },
    ["<Down>"] = { "<cmd>resize -2<cr>", "Window Height-", opts = { noremap = true } },
    ["<Left>"] = { "<cmd>vertical resize +2<cr>", "Window Width+", opts = { noremap = true } },
    ["<Right>"] = { "<cmd>vertical resize -2<cr>", "Window Width-", opts = { noremap = true } },
    ["<Leader>s"] = { "<cmd>ToggleScrollOff<cr>", "Toggle Cursor Center", opts = { noremap = true } },
    -- ["<Leader>fe"] = { "<cmd>Telescope file_browser<cr>", "Browse Files", opts = { noremap = true } },
    ["<Leader>ff"] = { "<cmd>Telescope find_files<cr>", "Files" },
    ["<Leader>fs"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find Symbols" },
    ["<Leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    ["<Leader>fg"] = {
      "<cmd>lua require('telescope.builtin').live_grep({default_text=vim.fn.expand('<cword>')})<cr>",
      "Grep",
    },
    ["<Leader>a"] = { "<cmd>NvimTreeToggle<cr>", "Commnads" },
    ["<Leader>fc"] = { "<cmd>Telescope commands<cr>", "Commnads" },
    -- ["<Leader>fp"] = { "<cmd>Telescope projects<cr>", "Projects" },
    ["<Leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["<Leader>ft"] = { "<cmd>Telescope<cr>", "Telescope" },
    ["<Leader>de"] = { "<cmd>lua require('dapui').eval()<cr>", "Dap eval expression" },
    ["<Leader>dw"] = { "<cmd>set wrap!<cr>", "Toggle Line Wrap" },
    ["<Leader>da"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    ["<Leader>dr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["<Leader>dd"] = { "<cmd>DapContinue<cr>", "Run Debug" },
    ["<Leader>du"] = { "<cmd>lua require('dapui').toggle()<cr>", "Debug Windows" },
    ["<Leader>db"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
    ["<Leader>dt"] = { "<cmd>Trouble document_diagnostics<cr>", "Toggle Trouble" },
    ["<Leader>ds"] = { "<cmd>SymbolsOutline<cr>", "Toggle Outline" },
    ["<Leader>gs"] = { "<cmd>lua require('neogit').open()<cr>", "Git" },
    ["<Leader>gh"] = { "<cmd>DiffviewOpen<cr>", "Git Diff", opts = { silent = true } },
    ["<Leader>gf"] = { "<cmd>DiffviewFileHistory %<cr>", "Git File History", opts = { silent = true } },
    ["<Leader>gl"] = { "<cmd>DiffviewFileHistory<cr>", "Git Log", opts = { silent = true } },
    ["<Leader>djt"] = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Java Method" },
    ["<Leader>djj"] = { "<cmd>JdtUpdateConfig<cr>", "Jdtls Update Config" },
    ["<Leader>dm"] = { "<cmd>Maven<cr>", "Maven" },
    ["<Leader>dh"] = { "<cmd>CurrentHighlight<cr>" },
    ["<Leader>dp"] = {
      function()
        require("base46").load_all_highlights()
      end,
    },
    ["<C-w>w"] = { "<cmd>WinShift<cr>", "Move Window" },
    ["<Leader>rr"] = { "<cmd>Lazy reload markup.nvim<cr>", "reload plugin", opts = { silent = true } },
  },
  v = {
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "hop in line", opts = { noremap = true } },
    ["q"] = { "<cmd>HopChar1<cr>", "hop in buffer", opts = { noremap = true } },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gd"] = { "<cmd>Trouble lsp_definitions<cr>", "LSP declaration" },
    ["gi"] = { "<cmd>Trouble lsp_implementations<cr>", "LSP implementation" },
    ["gD"] = { "<cmd>Trouble lsp_type_definitions<cr>", "LSP definition type" },
    ["gr"] = { "<cmd>Trouble lsp_references<cr>", "LSP references" },
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fb"] = {
      "<cmd>lua require('telescope.builtin').buffers({sort_lastused = true, sort_mru = true, only_cwd = true, ignore_current_buffer = true})<CR>",
      "Find buffers",
    },
    ["<leader>fw"] = {
      "<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<CR>",
      "Live grep opened files",
    },
  },
}
-- more keybinds!

-- disable default keymap
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["v"] = "",
    ["<leader>f"] = "",
    -- ['<leader>th'] = ''
  },
}

return M

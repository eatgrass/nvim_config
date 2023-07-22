local rtdap = require "rust-tools.dap"
local lspconfig = require "custom.configs.lspconfig"

local extension_path = "/Users/huangjing/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

local adapter = rtdap.get_codelldb_adapter(codelldb_path, liblldb_path)

local opts = {
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      -- max_len_align = true,
    },
    hover_actions = {
      auto_focus = true,
    },
  },
  server = lspconfig.genServerConfig('rust_analyzer'),
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  dap = {
    adapter,
  },
}

return opts

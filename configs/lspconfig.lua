local on_attach = require("custom.lsp.handler").on_attach
local capabilities = require("custom.lsp.handler").capabilities
local lspconfig = require "lspconfig"

local M = {}

M.genServerConfig = function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "custom.lsp." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  return opts
end

-- if you just want default config for the servers then put them in a table
local servers = { "volar", "clangd" }

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

for _, lsp in ipairs(servers) do
  local opts = M.genServerConfig(lsp)
  if lsp ~= "jdtls" then
    lspconfig[lsp].setup(opts)
  end
end

return M
--
-- lspconfig.pyright.setup { blabla}

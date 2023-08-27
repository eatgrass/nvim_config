dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

local allow_format = {
  "pyright",
  "rust_analyzer",
}

local custom_mappings = {
  "rust_analyzer",
}
-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })
  local format = false

  for _, v in ipairs(allow_format) do
    if v == client.name then
      format = true
      break
    end
  end

  for _, v in ipairs(custom_mappings) do
    if v == client.name then
      utils.load_mappings("lsp_" .. client.name, { buffer = bufnr })
      break
    end
  end

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  client.server_capabilities.documentFormattingProvider = format
  client.server_capabilities.documentRangeFormattingProvider = format

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

M.genServerConfig = function(server)
  local opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "custom.lsp." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  return opts
end

local servers = { "volar", "clangd", "pyright" }

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
  { name = "DiagnosticSignHint", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

for _, lsp in ipairs(servers) do
  local opts = M.genServerConfig(lsp)
  if lsp ~= "jdtls" then
    require("lspconfig")[lsp].setup(opts)
  end
end
return M

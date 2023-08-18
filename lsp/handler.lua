local lspconfig = require "plugins.configs.lspconfig"

local M = {}

-- export on_attach & capabilities for custom lspconfigs

local allow_format = {
  "pyright",
  "null-ls",
  "jdtls",
  "lua_ls",
  "rust_analyzer",
  "volar",
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local auto_format_enabled = false
local lsp_formatting = function(bufnr)
  local found = false
  vim.lsp.buf.format {
    filter = function(client)
      if not auto_format_enabled then
        return false
      end
      for _, v in ipairs(allow_format) do
        if v == client.name then
          found = true
          break
        end
      end
      return found
    end,
    bufnr = bufnr,
  }
end

M.toggleAutoFormat = function()
  auto_format_enabled = not auto_format_enabled
  print("auto format enabled:" .. auto_format_enabled)
end

M.on_attach = function(client, bufnr)
  lspconfig.on_attach(client, bufnr)
  -- lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)

  if client.server_capabilities.code_lens then
    local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
      group = codelens,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      buffer = bufnr,
    })
  end

  if client.supports_method "textDocument/formatting" then
    print("support format")
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<Leader>dF",
      "<cmd>lua require('modules.lsp.handlers').toggleAutoFormat()<cr>",
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>df", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        print("formatting buffer")
        lsp_formatting(bufnr)
      end,
    })
  else
    print("not support")
  end

  -- if client.server_capabilities.documentSymbolProvider then
  -- require("nvim-navic").attach(client, bufnr)
  -- end
end

M.capabilities = lspconfig.capabilities

return M

local lspconfig = require("plugins.configs.lspconfig")

local M = {}

-- export on_attach & capabilities for custom lspconfigs

local allow_format = {
  "null-ls",
  "jdtls",
  "lua_ls",
  "rust_analyzer",
  "volar",
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gvd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gsd", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gsi", "<cmd>split | lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gvi", "<cmd>vsplit | lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gr",
    "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>",
    opts
  )
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

-- local function lsp_highlight_document(client)
--     local status_ok, illuminate = pcall(require, "illuminate")
--     if not status_ok then
--         return
--     end
--     illuminate.on_attach(client)
-- end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local auto_format_enabled = false
local lsp_formatting = function(bufnr)
  local found = false
  vim.lsp.buf.format({
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
  })
end

M.toggleAutoFormat = function()
  auto_format_enabled = not auto_format_enabled
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

  if client.supports_method("textDocument/formatting") then
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<Leader>dF",
      "<cmd>lua require('modules.lsp.handlers').toggleAutoFormat()<cr>",
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>df", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  -- if client.server_capabilities.documentSymbolProvider then
  -- require("nvim-navic").attach(client, bufnr)
  -- end
end

M.capabilities = lspconfig.capabilities

return M

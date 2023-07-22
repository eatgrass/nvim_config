local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with({
    filetypes = { "json", "html", "xml", "markdown", "css", "typescript", "javascript", "vue" },
    -- extra_filetypes = { "java" },
  }), -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- XML
  b.formatting.xmllint,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
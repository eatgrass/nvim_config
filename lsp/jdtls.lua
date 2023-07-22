local home = os.getenv "HOME"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local autocmd = vim.api.nvim_create_autocmd
local bundles = {
  vim.fn.glob(home .. "/.config/nvim/jars/java-debug/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/jars/vscode-java-test/server/*.jar"), "\n"))

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
extendedClientCapabilities.progressReportProvider = false

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown" },
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

local remap = function(bufnr, mode, rhs, lhs, bufopts, desc)
  if bufopts == nil then
    bufopts = {}
  end
  bufopts.desc = desc
  vim.api.nvim_buf.set_keymap(bufnr, mode, rhs, lhs, bufopts)
end

local on_attach = function(client, bufnr)

  local handler = require "custom.lsp.handler"
  handler.on_attach(client, bufnr)

  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
  require("jdtls").setup_dap { hotcodereplace = "auto" }
  require("jdtls.dap").setup_dap_main_class_configs()
  require('jdtls.setup').add_commands()
  local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })

  vim.lsp.codelens.refresh()
  vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
    group = codelens,
    callback = function()
      vim.lsp.codelens.refresh()
    end,
    buffer = bufnr,
  })


  -- vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
  -- vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
  -- vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
  -- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
  -- vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
  -- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"
  -- remap(bufnr, "n", "<A-o>", "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Import")
  -- remap(bufnr, "n", "<Leader>jtc", "<cmd>lua require'jdtls'.test_class()<CR>", "Test Class")
  -- remap(bufnr, "n", "<Leader>jtm", "<cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method")
  -- require("core.utils").load_mappings("jdtls")
  -- print("jdtls mapping loaded")
end

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    "/usr/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",
    "-data",
    home .. "/.cache/jdtls/workspace/" .. project_name,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        -- maven ={

        -- },
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = home .. "/Library/Java/JavaVirtualMachines/azul-1.8.0_345/Contents/Home",
          },
        },
      },
      maven = {
        enabled = true,
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true, --Don't automatically show implementations
      },
      referencesCodeLens = {
        enabled = true, --Don't automatically show references
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
        settings = {
          url = home .. "/.config/nvim/jars/eclipse-java-google-style.xml",
        },
        -- settings = {
        --   profile = "asdf"
        -- }
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
  completion = {
    favoriteStaticMembers = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*",
    },
  },
  sources = {
    organizeImports = {
      starThreshold = 9999,
      staticStarThreshold = 9999,
    },
  },
  codeGeneration = {
    toString = {
      template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
    },
    useBlocks = true,
  },
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  },
  flags = {
    allow_incremental_sync = true,
  },
}

return config

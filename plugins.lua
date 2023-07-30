local overrides = require "custom.configs.overrides"

local reload_colorized = function()
  local base_30 = require("base46").get_theme_tb "base_30"
  local base_16 = require("base46").get_theme_tb "base_16"
  local hl = require "custom.hl_utils"

  require("colorizer").setup {
    user_default_options = {
      custom = vim.tbl_extend("keep", base_30, base_16, hl.colors, hl.groups),
      virtualtext = "",
      mode = "inline",
    },
  }
end

vim.api.nvim_create_user_command("ReloadColors", reload_colorized, {})

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "eatgrass/maven.nvim",
    cmd = { "Maven", "MavenExec" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("maven").setup {
        executable = "/Users/huangjing/.m2/wrapper/dists/apache-maven-3.8.3-bin/5a6n1u8or3307vo2u2jgmkhm0t/apache-maven-3.8.3/bin/mvn",
      }
    end,
  },
  -- {
  --   "eatgrass/markup.nvim",
  --   event = "VeryLazy",
  --   dev = true,
  --   config = function()
  --     require("markup").setup()
  --   end,
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  {
    "chentoast/marks.nvim",
    keys = { { mode = "n", "m" } },
    config = function()
      require("marks").setup {
        default_mappings = false,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "",
          virt_text = "",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
          annotate = false,
        },
        mappings = {},
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local cmp = require "cmp"
      opts.mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        [""] = cmp.mapping {
          i = cmp.mapping.complete(),
          s = cmp.mapping.complete(),
        },
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Right>"] = {
          c = cmp.mapping.confirm { select = false },
        },
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }
      cmp.setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        mode = "document_diagnostics",
        severity = vim.diagnostic.severity.ERROR,
        auto_preview = false,
        include_declaration = {},
      },
      cmd = { "Trouble", "TroubleToggle" },
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = { { mode = "n", "gcc", "gbc" }, { mode = "v", "gc", "gbc" } },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    cmd = { "HopChar1CurrentLine", "HopChar1" },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    dependencies = { "nvim-lspconfig" },
    event = "LspAttach",
    config = function()
      require("fidget").setup {
        window = {
          blend = 0,
        },
      }
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    event = "BufEnter",
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "nvim-lspconfig" },
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = function()
          return require "custom.configs.dapui"
        end,
        config = function(_, opts)
          require("dapui").setup(opts)
        end,
      },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.outline"
    end,
    config = function(_, opts)
      require("symbols-outline").setup(opts)
    end,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = false,
    opts = function()
      return require "custom.configs.navic"
    end,
    config = function(_, opts)
      require("nvim-navic").setup(opts)
    end,
  },
  {
    "RRethy/vim-illuminate",
    opts = function()
      return require "custom.configs.illuminate"
    end,
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    event = "VeryLazy",
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "dhruvasagar/vim-table-mode",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = function()
      return require "custom.configs.rust"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "TimUntersberger/neogit",
    event = "VeryLazy",
    dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup {
        kind = "split_above",
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true,
      }
      -- local colors = require("base46").get_theme_tb "base_30"
      -- local generate_color = require("base46.colors").change_hex_lightness
      -- vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = "#2b4651" })
      -- vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#1a3a56" })
      -- vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = colors.light_grey })
    end,
  },
  {
    "sindrets/winshift.nvim",
    event = "VeryLazy",
    config = function() end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function() end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
    dependencies = "NvChad/base46",
    config = reload_colorized,
  },

  {
    "eatgrass/colorizer",
    enabled = false,
    init = function()
      require("core.utils").lazy_load "colorizer"
    end,
    config = function(_, opts)
      reload_colorized()
      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer" },
    event = "VeryLazy",
    config = function()
      local cmp = require "cmp"
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    opts = {
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- All NvChad plugins are lazy-loaded by default
  -- If you don't want this behavior, add lazy = false to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

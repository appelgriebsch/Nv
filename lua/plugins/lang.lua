return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = vim.fn.has('nvim-0.10') },
      ---@type lspconfig.options
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "lua-language-server", "marksman" })
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      }
    end,
  },

  -- disable the fancy UI for the debugger
  { "rcarriga/nvim-dap-ui", enabled = false },

  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dw"] = { name = "+widgets" },
      }
    }
  },

  -- dap integration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    keys = {
      {
        "<leader>de",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression, { border = "none" }) end,
        desc = "Eval",
        mode = { "n", "v" }
      },
      {
        "<leader>dwf",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" }) end,
        desc = "Frames"
      },
      {
        "<leader>dws",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" }) end,
        desc = "Scopes"
      },
      {
        "<leader>dwt",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" }) end,
        desc = "Threads"
      },
    },
    opts = function(_, opts)
      require("dap").defaults.fallback.terminal_win_cmd = "enew | set filetype=dap-terminal"
    end
  },

  -- java setup
  {
    "nvim-java/nvim-java",
    optional = true,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              settings = {
                java = {
                  configuration = {
                    updateBuildConfiguration = "automatic",
                  },
                  codeGeneration = {
                    toString = {
                      template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                    },
                    useBlocks = true,
                  },
                  completion = {
                    favoriteStaticMembers = {
                      "org.assertj.core.api.Assertions.*",
                      "org.junit.Assert.*",
                      "org.junit.Assume.*",
                      "org.junit.jupiter.api.Assertions.*",
                      "org.junit.jupiter.api.Assumptions.*",
                      "org.junit.jupiter.api.DynamicContainer.*",
                      "org.junit.jupiter.api.DynamicTest.*",
                      "org.mockito.Mockito.*",
                      "org.mockito.ArgumentMatchers.*",
                      "org.mockito.Answers.*"
                    },
                    importOrder = {
                      "#",
                      "java",
                      "javax",
                      "org",
                      "com"
                    },
                  },
                  contentProvider = { preferred = "fernflower" },
                  eclipse = {
                    downloadSources = true,
                  },
                  flags = {
                    allow_incremental_sync = true,
                    server_side_fuzzy_completion = true
                  },
                  implementationsCodeLens = {
                    enabled = false, --Don"t automatically show implementations
                  },
                  inlayHints = {
                    parameterNames = { enabled = "all" }
                  },
                  maven = {
                    downloadSources = true,
                  },
                  referencesCodeLens = {
                    enabled = false, --Don"t automatically show references
                  },
                  references = {
                    includeDecompiledSources = true,
                  },
                  saveActions = {
                    organizeImports = true,
                  },
                  signatureHelp = { enabled = true },
                  sources = {
                    organizeImports = {
                      starThreshold = 9999,
                      staticStarThreshold = 9999,
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  },

}
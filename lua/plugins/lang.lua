return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- sourcekit will be automatically installed with mason and loaded with lspconfig
        sourcekit = {},
      },
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "marksman"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗"
        }
      }
    },
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
    keys = {
      { "<leader>de",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression, { border = "none" }) end,
        desc = "Eval",
        mode = { "n", "v" } },
      { "<leader>dwf",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" }) end,
        desc = "Frames" },
      { "<leader>dws",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" }) end,
        desc = "Scopes" },
      { "<leader>dwt",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" }) end,
        desc = "Threads" },
    },
    opts = function(_, opts)
      require("dap").defaults.fallback.terminal_win_cmd = "enew | set filetype=dap-terminal"
    end
  },

  -- core language specific extension modules
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  -- custom language specific extension modules
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.nodejs" },

}

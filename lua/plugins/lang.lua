return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = vim.fn.has('nvim-0.10') },
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

  -- debugger specific extension modules
  { import = "lazyvim.plugins.extras.dap.nlua" },

  -- core language specific extension modules
  -- { import = "lazyvim.plugins.extras.lang.clangd" },
  -- { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  -- { import = "lazyvim.plugins.extras.lang.elixir" },
  -- { import = "lazyvim.plugins.extras.lang.go" },
  -- { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.python" },
  -- { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  -- { import = "lazyvim.plugins.extras.lang.tex" },
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- custom language specific extension modules
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.nodejs" },

  -- overwrite Rust tools inlay hints
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          -- nvim >= 0.10 has native inlay hint support,
          -- so we don't need the rust-tools specific implementation any longer
          auto = not vim.fn.has('nvim-0.10')
        }
      }
    }
  },

}

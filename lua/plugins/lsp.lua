return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗"
        }
      }
    },
  },

  -- language specific extension modules
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },

}
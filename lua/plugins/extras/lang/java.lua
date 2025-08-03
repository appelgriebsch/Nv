local Util = require("lazyvim.util")

return {

  -- Add java to treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },

  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              keys = {
                -- Workaround for the lack of neotest-java support in nvim-java (https://github.com/nvim-java/nvim-java/issues/97)
                { "<leader>td", function() require('java').test.debug_current_method() end, desc = "Debug Nearest (Java)" },
                { "<leader>tr", function() require('java').test.run_current_method() end, desc = "Run Nearest (Java)"},
                { "<leader>tt", function() require('java').test.run_current_class() end, desc = "Run File (Java)"},
                { "<leader>to", function() require('java').test.view_last_report() end, desc = "Show Output (Java)"}
              }
            },
          },
          setup = {
            jdtls = function()
              require('java').setup({
                java_test = {
                  enable = Util.has("nvim-dap"),
                },
                java_debug_adapter = {
                  enable = Util.has("nvim-dap"),
                },
                spring_boot_tools = {
                  enable = false,
                },
                jdk = {
                  auto_install = false,
                },
              })
            end,
          },
        },
      },
    },
  },
}

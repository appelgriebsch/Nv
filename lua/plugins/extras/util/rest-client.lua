return {

  -- Ensure jq tool is installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "jq" })
    end,
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+http" },
      },
    },
  },

  {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = { "http" },
    opts = {
        -- check default config for more information
        -- https://github.com/rest-nvim/rest.nvim/blob/main/lua/rest-nvim/config/init.lua
        result_split_horizontal = true,
        result = {
          show_curl_command = false,
        },
    },
    keys = {
      { "<leader>hp", function() require("rest-nvim").run(true) end, desc = "Preview Request" },
      { "<leader>hr", function() require("rest-nvim").run() end, desc = "Run Request" },
    }
  },
}

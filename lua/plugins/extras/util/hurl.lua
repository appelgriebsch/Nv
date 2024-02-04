return {

  -- Ensure jq tool is installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "jq", "prettier" })
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
    "jellydn/hurl.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = { "hurl" },
    opts = {
      -- Show debugging info
      debug = false,
      -- Show notification on run
      show_notification = true,
      -- Show response in popup or split
      mode = "split",
      -- Default formatter
      formatters = {
        json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
        html = {
          'prettier',    -- Make sure you have install prettier in your system, e.g: npm install -g prettier
          '--parser',
          'html',
        },
      },
    },
    keys = {
      -- Run API request
      { "<leader>hA", "<cmd>HurlRunner<CR>",        desc = "Run All requests" },
      { "<leader>ha", "<cmd>HurlRunnerAt<CR>",      desc = "Run Api request" },
      { "<leader>he", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
      { "<leader>hv", "<cmd>HurlVerbose<CR>",       desc = "Run Api in verbose mode" },
      -- Run Hurl request in visual mode
      { "<leader>ha", ":HurlRunner<CR>",            desc = "Hurl Runner",             mode = "v" },
    },
  },

}

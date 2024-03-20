return {

  -- Add http to treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "lua", "xml", "http", "json", "graphql" })
    end,
  },

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
    "vhyrro/luarocks.nvim",
    branch = "go-away-python",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    },
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    opts = {
    },
    keys = {
      { "<leader>hr", "<CMD>Rest run<CR>",                                              desc = "Run Request" },
      { "<leader>he", function() require("telescope").extensions.rest.select_env() end, desc = "Select environment" }
    },
    config = function(_, opts)
      require("rest-nvim").setup(opts)
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("rest")
      end)
    end,
  },
}
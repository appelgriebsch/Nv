return {

  -- add nodejs specific modules to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
  },

  -- correctly setup mason lsp extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml-language-server" })
      end
    end,
  },

  -- setup yaml schema companion
  {
    "someone-stole-my-name/yaml-companion.nvim",
    event = "VeryLazy",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function(_, opts)
      require("telescope").load_extension("yaml_schema")
    end,
  },

}

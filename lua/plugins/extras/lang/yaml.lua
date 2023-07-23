return {

  -- add yaml specific modules to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
      version = false, -- last release is way too old
      config = function(_, opts)
        require("telescope").load_extension("yaml_schema")
      end,
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        yamlls = {}
      }
    },
  }
}

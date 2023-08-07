return {

  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      })
    end,
  },

  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- tidy
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    }
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "comment",
          "diff",
          "dockerfile",
          "dot",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "graphql",
          "hcl",
          "http",
          "jq",
          "make",
          "mermaid",
          "sql"
        })
      end
    end
  },

}

return {

  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      table.insert(cmp.mapping.preset, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      })
      table.insert(cmp.mapping.preset, {
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
    end,
  },

  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = true
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

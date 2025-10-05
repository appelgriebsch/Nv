return {
  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "vuki656/package-info.nvim",
        event = { "BufRead package.json" },
        opts = {}
      },
      {
        "David-Kunz/cmp-npm",
        event = { "BufRead package.json" },
        opts = {}
      }
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "npm", keyword_length = 3 },
      }))
    end
  },

  -- add nodejs specific modules to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css", "html", "javascript", "jsdoc", "scss" })
    end,
  },

  -- correctly setup mason lsp extensions
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed,
        { "css-lsp", "eslint-lsp", "html-lsp", "standardjs", "stylelint-lsp" })
    end,
  },

  -- import additional language modules from upstream
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.typescript" }

}
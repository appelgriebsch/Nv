return {
  -- tidy
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>uW", function() require("tidy").toggle() end, desc = "Toggle Tidy Whitespaces" },
    },
    opts = {
      filetype_exclude = { "markdown", "diff" },
    }
  },
}

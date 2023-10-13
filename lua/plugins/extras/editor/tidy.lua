return {
  -- tidy
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>ut", function() require("tidy").toggle() end, desc = "Toggle Tidy" },
    },
    opts = {
      filetype_exclude = { "markdown", "diff" },
    }
  },
}

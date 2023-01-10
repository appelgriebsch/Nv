return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      require("github-theme").setup({
        theme_style = "dark",
        comment_style = "NONE",
        keyword_style = "NONE",
        function_style = "NONE",
        variable_style = "NONE"
      })
    end,
  },

}

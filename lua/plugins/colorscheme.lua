return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  -- use onedarkpro instead
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme onedark")
      require("onedarkpro").setup()
    end,
  },

}

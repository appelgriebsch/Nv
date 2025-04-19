return {
  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable github nvim theme
  { "projekt0n/github-nvim-theme", enabled = false },

  -- disable onedarkpro nvim theme
  { "olimorris/onedarkpro.nvim", enabled = false },

  -- toggle theme
  {
    "eliseshaffer/darklight.nvim",
    dependencies = {
      -- load ayu theme
      { "Shatur/neovim-ayu" },
    },
    opts = {
      mode = "colorscheme",
      light_mode_colorscheme = "ayu-light",
      dark_mode_colorscheme = "ayu-mirage"
    }
  },

  -- Configure LazyVim to load onedarkpro theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
      end
    }
  }
}

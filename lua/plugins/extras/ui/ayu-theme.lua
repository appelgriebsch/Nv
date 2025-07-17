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
        local theme = require("ayu");
        local opts = {
          overrides = function()
            if vim.o.background == 'dark' then
              local colors = require('ayu.colors')
              colors.generate(true) -- Pass `true` to enable mirage
              return {
                AlphaHeader = { fg = colors.accent },
                AlphaShortcut = { fg = colors.accent },
                AlphaFooter = { fg = colors.fg },
                Comment = { italic = false }
              }
            else
              local colors = require('ayu.colors')
              colors.generate() -- Pass `true` to enable mirage
              return {
                AlphaHeader = { fg = colors.accent },
                AlphaShortcut = { fg = colors.accent },
                AlphaFooter = { fg = colors.fg },
                Comment = { italic = false }
              }
            end
          end
        }
        theme.setup(opts)
      end
    }
  }
}
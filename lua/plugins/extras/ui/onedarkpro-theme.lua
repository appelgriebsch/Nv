return {
  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable github nvim theme
  { "projekt0n/github-nvim-theme", enabled = false },

  -- disable ayu theme
  { "Shatur/neovim-ayu", enabled = false },

  -- toggle theme
  {
    "eliseshaffer/darklight.nvim",
    dependencies = {
      -- load onedarkpro nvim theme
      { "olimorris/onedarkpro.nvim" },
    },
    opts = {
      mode = "colorscheme",
      light_mode_colorscheme = "onelight",
      dark_mode_colorscheme = "onedark_vivid"
    }
  },

  -- Configure LazyVim to load onedarkpro theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local theme = require("onedarkpro");
        local utils = require("onedarkpro.helpers")
        local colors = utils.get_colors()
        local opts = {
          styles = {
            strings = "NONE", -- Style that is applied to strings
            comments = "NONE", -- Style that is applied to comments
            keywords = "NONE", -- Style that is applied to keywords
            functions = "NONE", -- Style that is applied to functions
            variables = "NONE", -- Style that is applied to variables
          },
          options = {
            terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
            cursorline = false, -- Use cursorline highlighting?
          },
          highlights = {
            AlphaHeader = { fg = colors.yellow },
            AlphaButtons = { fg = colors.fg },
            AlphaShortcut = { fg = colors.red },
            AlphaFooter = { fg = colors.highlight },
            DashboardHeader = { fg = colors.yellow },
            DashboardIcon = { fg = colors.green },
            DashboardKey = { fg = colors.red },
            DashboardFooter = { fg = colors.highlight },
          }
        }
        theme.setup(opts)
      end
    }
  }
}

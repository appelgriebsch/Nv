return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  { "olimorris/onedarkpro.nvim" },

  -- Configure LazyVim to load color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local onedarkpro = require("onedarkpro")
        onedarkpro.setup({
          theme = "onedark_vivid",
          styles = {
            strings = "NONE", -- Style that is applied to strings
            comments = "NONE", -- Style that is applied to comments
            keywords = "NONE", -- Style that is applied to keywords
            functions = "NONE", -- Style that is applied to functions
            variables = "NONE", -- Style that is applied to variables
          },
          highlights = {
            AlphaHeader = { fg = "${yellow}" },
            AlphaButtons = { fg = "${white}" },
            AlphaShortcut = { fg = "${red}" },
            AlphaFooter = { fg = "${yellow}" },
          },
          options = {
            bold = false, -- Use the themes opinionated bold styles?
            terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
            cursorline = false, -- Use cursorline highlighting?
          }
        })
        onedarkpro.load()
      end
    },
  },

}

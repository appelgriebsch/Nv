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
        local color = require("onedarkpro.helpers")
        local colorscheme
        if string.match(os.getenv("THEME"), "Light") then
          colorscheme = "onelight"
          vim.o.background = "light"
        else
          colorscheme = "onedark_vivid"
          vim.o.background = "dark"
        end
        local colors = color.get_colors(colorscheme)
        local opts = {
          theme = colorscheme,
          styles = {
            strings = "NONE", -- Style that is applied to strings
            comments = "NONE", -- Style that is applied to comments
            keywords = "NONE", -- Style that is applied to keywords
            functions = "NONE", -- Style that is applied to functions
            variables = "NONE", -- Style that is applied to variables
          },
          options = {
            bold = false, -- Use the themes opinionated bold styles?
            terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
            cursorline = false, -- Use cursorline highlighting?
          },
          highlights = {
            AlphaHeader = { fg = colors.yellow },
            AlphaButtons = { fg = colors.fg },
            AlphaShortcut = { fg = colors.red },
            AlphaFooter = { fg = colors.highlight },
          }
        }
        onedarkpro.setup(opts)
        vim.cmd("colorscheme " .. colorscheme)
      end
    },
  },

}

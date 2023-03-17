return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  { "Shatur/neovim-ayu" },

  -- Configure LazyVim to load color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local ayu = require("ayu")
        local colors = require('ayu.colors')
        colors.generate(true)
        ayu.setup({
          mirage = true,
          overrides = {
            AlphaHeader = { fg = colors.accent },
            AlphaButtons = { fg = colors.ui },
            AlphaShortcut = { fg = colors.tag },
            NormalFloat = { bg = "#242B38" },
            CursorLine = { bg = colors.bg },
            CursorLineNr = { bg = colors.bg },
          }
        })
        ayu.colorscheme()
      end
    },
  },

}

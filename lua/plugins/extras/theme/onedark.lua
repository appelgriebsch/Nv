local M = {}

function M.setup(colorscheme)
  local theme = require("onedarkpro");
  local utils = require("onedarkpro.helpers")
  local colors = utils.get_colors(colorscheme)
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
  theme.setup(opts)
  vim.cmd("colorscheme " .. colorscheme)
end

return M

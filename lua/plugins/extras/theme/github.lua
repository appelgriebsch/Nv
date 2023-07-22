local M = {}

function M.setup(colorscheme)
  local theme = require("github-theme");
  local opts = {
    options = {
      transparent = false, -- Disable setting background
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = true,
    },
    styles = {
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
    },
    darken = { -- Darken floating windows and sidebar-like windows
      floats = true,
      sidebars = {
        enable = false,
      },
    },
    groups = {
      all = {
        AlphaHeader = { link = 'Title' },
        AlphaButtons = { link = 'Identifier' },
        AlphaShortcut = { link = 'Keyword' },
        AlphaFooter = { link = 'Comment' },
      }
    }
  }
  theme.setup(opts)
  vim.cmd("colorscheme " .. colorscheme)
end

return M

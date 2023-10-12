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
        DashboardHeader = { link = 'Title' },
        DashboardIcon = { link = 'Identifier' },
        DashboardKey = { link = 'Keyword' },
        DashboardFooter = { link = 'Comment' },
      }
    }
  }
  theme.setup(opts)
  vim.cmd("colorscheme " .. colorscheme)
end

return M

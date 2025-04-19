return {
  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable onedarkpro nvim theme
  { "olimorris/onedarkpro.nvim", enabled = false },

  -- disable ayu theme
  { "Shatur/neovim-ayu", enabled = false },

  -- toggle theme
  {
    "eliseshaffer/darklight.nvim",
    dependencies = {
      -- load github nvim theme
      { "projekt0n/github-nvim-theme" },
    },
    opts = {
      mode = "colorscheme",
      light_mode_colorscheme = "github_light",
      dark_mode_colorscheme = "github_dark"
    }
  },

  -- Configure LazyVim to load github theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
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
              AlphaHeader = { link = "Title" },
              AlphaButtons = { link = "Identifier" },
              AlphaShortcut = { link = "Keyword" },
              AlphaFooter = { link = "Comment" },
              DashboardHeader = { link = "Title" },
              DashboardIcon = { link = "Identifier" },
              DashboardKey = { link = "Keyword" },
              DashboardFooter = { link = "Comment" },
            }
          }
        }
        theme.setup(opts)
      end
    },
  },
}

return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  { "projekt0n/github-nvim-theme" },

  -- Configure LazyVim to load color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local colorscheme = os.getenv("NV_THEME")
        if colorscheme ~= nil and string.match(colorscheme, "[L|l]ight") then
          colorscheme = "github_light"
          vim.o.background = "light"
        else
          colorscheme = "github_dark_dimmed"
          vim.o.background = "dark"
        end
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
              AlphaButtons =  { link = 'Identifier' },
              AlphaShortcut = { link = 'Keyword' },
              AlphaFooter =  { link = 'Comment' },
            }
          }
        }
        theme.setup(opts)
        vim.cmd("colorscheme " .. colorscheme)
      end
    },
  },

}

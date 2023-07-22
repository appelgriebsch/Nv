-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")({
  debug = false,
  defaults = {
    lazy = true,
    -- cond = false,
  },
  nv = {
    colorscheme = "onelight",
    copilot_support = false,
    dap_support = true,
    lang = {
      clangd = false,
      docker = true,
      elixir = false,
      go = false,
      java = false,
      nodejs = true,
      python = true,
      ruby = false,
      rust = true,
      terraform = false,
      tex = false
    },
    test_support = true
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")({
  debug = false,
  defaults = {
    lazy = true,
    -- cond = false,
  },
  nv = {
    colorscheme = "onelight", -- colorscheme setting for either onedark.nvim or github-theme
    codeium_support = false, -- enable codeium extension
    copilot_support = false, -- enable copilot extension
    coverage_support = true, -- enable coverage extension
    dap_support = true, -- enable dap extension
    lang = {
      clangd = false, -- enable clangd and cmake extension
      docker = true, -- enable docker extension
      elixir = false, -- enable elixir extension
      go = false, -- enable go extension
      java = false, -- enable java extension
      nodejs = true, -- enable nodejs (typescript, css, html, json) extension
      python = true, -- enable python extension
      ruby = false, -- enable ruby extension
      rust = true, -- enable rust extension
      terraform = false, -- enable terraform extension
      tex = false, -- enable tex extension
      yaml = true, -- enable yaml extension
    },
    rest_support = true, -- enable rest.nvim extension
    test_support = true -- enable test extension
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})

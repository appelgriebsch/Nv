# Nv

A [Neovim](https://neovim.io) setup based on [LazyVim](https://github.com/LazyVim/LazyVim)

## 🚀 Getting Started

1. Install [Neovim] version 0.8 or higher on your machine
2. Remove or backup your existing configuration files in `~/.config/nvim`
3. Clone the git repo `git clone https://github.com/appelgriebsch/Nv ~/.config/nvim`
4. Configure `Nv` in `init.lua` file according to your needs - default options:
```lua
  nv = {
    colorscheme = "onelight",   -- colorscheme setting for either onedark.nvim or github-theme
    copilot_support = false,    -- enable copilot extension
    codeium_support = false,    -- enable codeium extension
    coverage_support = true,    -- enable coverage extension
    dap_support = true,         -- enable dap extension
    lang = {
      clangd = false,           -- enable clangd and cmake extension
      docker = true,            -- enable docker extension
      elixir = false,           -- enable elixir extension
      go = false,               -- enable go extension
      java = false,             -- enable java extension
      nodejs = true,            -- enable nodejs (typescript, css, html, json) extension
      python = true,            -- enable python extension
      ruby = false,             -- enable ruby extension
      rust = true,              -- enable rust extension
      terraform = false,        -- enable terraform extension
      tex = false               -- enable tex extension
    },
    rest_support = true,        -- enable rest.nvim extension
    test_support = true         -- enable test extension
  },
```
5. Run `nvim` from a terminal

## Show case

### Dashboard

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/4cbc6ce5-2b73-4d8c-8a65-e9469e0952ec)

### Telescope

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/5abcd2c4-1c21-4dc8-acc2-a57257f35034)

### Code editor

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/87922d98-eca6-4de4-955c-b3c884bfba36)

### Sidebar

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/b215d4a7-a123-4666-a36b-c132d5f04e17)

### Rust extension

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/9f1fedd6-f461-43b8-bd12-052ead1eba23)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/f1713bd7-7269-45e3-866b-3aeeb1cecb98)

### Debug Adapter support

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/0d103b08-d38e-4a31-994c-19776d6c173a)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/1f8e03b8-6acb-4422-ad9b-fb3a9661588b)

### Test support

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/afb5f415-764e-4a99-a9f6-1a147839d37d)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/07cd365f-6406-4c1d-8a79-b7c437c189ba)


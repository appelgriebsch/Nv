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
      tex = false,              -- enable tex extension
      yaml = true,              -- enable yaml extension
    },
    rest_support = true,        -- enable rest.nvim extension
    test_support = true         -- enable test extension
  },
```
5. Run `nvim` from a terminal

## Show case

### Dashboard

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/b6eb04fd-0b55-45b2-bfe7-832299b78262)

### Telescope

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/20a6a7e9-4c4c-4987-a58a-74efd3a946dd)

### Code editor

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/db355698-801f-472a-bae7-57fe2366290d)

### Sidebar

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/99b684bc-56b9-49f2-91b4-720e945cafd7)

### Rust extension

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/ad7d44da-8c5d-4262-a623-5acbd1ad5dd1)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/a3202f64-7bf9-4081-b939-e44fce9fc909)

### Debug Adapter support

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/8545f178-cede-424e-a760-3c0474065d36)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/969b99a9-5683-44e4-94bc-13ef5c24b334)

### Test support

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/8ae18d60-d1db-4c7c-945f-b1f85e8b1641)

![imagem](https://github.com/appelgriebsch/Nv/assets/6803419/235fc864-3f5f-40fa-801f-6023652990df)

### Coverage support

tbd

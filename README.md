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
    test_support = true         -- enable test extension
  },
```
5. Run `nvim` from a terminal

## Show case

### Dashboard

![Screenshot 2023-01-11 at 12 41 06](https://user-images.githubusercontent.com/6803419/211798031-c9e9a376-6f2b-4117-8b23-470a5fcd66b9.png)

### Telescope

![Screenshot 2023-01-11 at 12 41 35](https://user-images.githubusercontent.com/6803419/211798083-a506a3c5-3a25-4a44-b181-f01d1d78be10.png)

### Code editor

![Screenshot 2023-01-11 at 12 42 08](https://user-images.githubusercontent.com/6803419/211798196-98021cdd-1b65-4ad2-b309-d0026dc103ee.png)

### Symbols outline

![Screenshot 2023-01-11 at 12 42 37](https://user-images.githubusercontent.com/6803419/211798225-de622980-aa61-4d85-8028-f9867b1e6db1.png)

### Rust extension

![Screenshot 2023-01-11 at 12 46 01](https://user-images.githubusercontent.com/6803419/211798813-0226d579-b3dc-417f-b95c-076a877a002c.png)

![Screenshot 2023-01-11 at 12 46 43](https://user-images.githubusercontent.com/6803419/211798865-6e6b013b-41c2-4ddf-b791-2628a02149cc.png)

### Debug Adapter support

![Screenshot 2023-01-11 at 12 47 19](https://user-images.githubusercontent.com/6803419/211798911-2a49e27e-1363-4cab-9dcb-df366fb674b4.png)

![Screenshot 2023-01-11 at 12 49 32](https://user-images.githubusercontent.com/6803419/211799158-b276f1d4-3174-48e0-bea0-255e28773c83.png)

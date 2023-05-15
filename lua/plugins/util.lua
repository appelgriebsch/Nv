return {

  -- git diff view
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },

  {
    "andythigpen/nvim-coverage",
    event = "VeryLazy",
    config = true
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = true,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
    keys = {
      { "<leader>cp", function() require("rest-nvim").run(true) end, desc = "Preview Request" },
      { "<leader>ct", function() require("rest-nvim").run() end, desc = "Test Request" },
    }
  },

}

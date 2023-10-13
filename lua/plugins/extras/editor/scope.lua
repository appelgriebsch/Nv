return {
    -- scopes
    {
        "telescope.nvim",
        dependencies = {
            {
                "tiagovla/scope.nvim",
                event = "VeryLazy",
                opts = {},
                config = function(_, opts)
                    require("scope").setup(opts)
                    require("lazyvim.util").on_load("telescope.nvim", function()
                        require("telescope").load_extension("scope")
                    end)
                end,
            },
        },
    }
}

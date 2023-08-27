return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end
        },
    },
    config = function()
        local telescope = require "telescope"
        local actions = require "telescope.actions"

        local extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            },
        }

        telescope.setup {
            defaults = {
                layout_config = {
                    width = 0.8,
                    height = 0.8,
                    prompt_position = "top",
                    preview_cutoff = 120,
                    horizontal = { mirror = false },
                    vertical = { mirror = false },
                },
                layout_strategy = "horizontal",
                winblend = 0,
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                prompt_prefix = "   ",
                selection_caret = "󰜴 ",
                path_display = { "smart" },
                file_ignore_patterns = { ".git/", ".git\\", "node_modules" },
                mappings = {
                    i = {
                        ["<A-j>"] = actions.move_selection_next,
                        ["<A-k>"] = actions.move_selection_previous,
                        ["<Tab>"] = actions.move_selection_next,
                        ["<S-Tab>"] = actions.move_selection_previous,
                    },
                    n = {
                        [";"] = actions.close,
                    },
                },
            },
            extensions = extensions,
        }
    end,
}

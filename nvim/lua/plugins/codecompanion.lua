local config = require("config")

return config.ai
  and {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
      },
      display = {
        chat = {},
        diff = {
          provider = "mini_diff",
        },
      },
    },
    confige = function(_, opts)
      require("codecompanion").setup(opts)
    end,
  }

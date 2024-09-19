return {
  {
    "rcasia/neotest-java",
  },
  {
    "marilari88/neotest-vitest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-java" {
            ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
          },
          require "neotest-vitest" {},
        },
      }

      vim.keymap.set("n", "<leader>tp", function()
        require("neotest").run.run(vim.uv.cwd())
      end, { desc = "[T]est [P]project", noremap = true })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand "%")
      end, { desc = "[T]est [F]ile", noremap = true })

      vim.keymap.set("n", "<leader>tr", function()
        require("neotest").run.run()
      end, { desc = "[T]est [R]un", noremap = true })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").run.stop()
      end, { desc = "[T]est [S]top", noremap = true })

      vim.keymap.set("n", "<leader>ta", function()
        require("neotest").run.attach()
      end, { desc = "[T]est [A]ttach", noremap = true })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open()
      end, { desc = "[T]est output [O]pen", noremap = true })
    end,
  },
}

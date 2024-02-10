return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        icons = false,
      })

      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle()
      end)
      vim.keymap.set("n", "<leader>tw", function()
        require("trouble").open("workspace_diagnostics")
      end)
      vim.keymap.set("n", "<leader>td", function()
        require("trouble").open("document_diagnostics")
      end)
      vim.keymap.set("n", "<leader>tq", function()
        require("trouble").open("quickfix")
      end)
      vim.keymap.set("n", "<leader>tl", function()
        require("trouble").open("loclist")
      end)
      vim.keymap.set("n", "gR", function()
        require("trouble").open("lsp_references")
      end)
    end
  },
}

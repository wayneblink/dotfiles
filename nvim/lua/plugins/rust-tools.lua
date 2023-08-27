return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", require("rust-tools").rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<leader>a", require("rust-tools").code_action_group.code_action_group,
              { buffer = bufnr })
          end
        },
        tools = {

        }
      })
    end,
  }
}

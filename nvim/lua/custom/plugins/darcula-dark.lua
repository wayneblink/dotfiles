return {
  "xiantang/darcula-dark.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    vim.cmd "colorscheme darcula-dark"
  end,
}

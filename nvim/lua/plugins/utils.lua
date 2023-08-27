return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },
}
